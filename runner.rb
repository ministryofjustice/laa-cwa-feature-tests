require 'redis'
require 'open3'
require 'aws-sdk-s3'
require 'fileutils'

# Access Redis service and work queue name from environment variables
redis_service = ENV['REDIS_SERVICE']
work_queue = ENV['WORK_Q']
# AWS S3 setup
region = ENV['AWS_REGION']
bucket = ENV['BUCKET_NAME']
release = ENV['RELEASE_NAME']

# Connect to Redis/AWS
redis = Redis.new(url: redis_service)
s3 = Aws::S3::Client.new(region: region)

loop do
  # Pop a test from the work queue
  test = redis.lpop(work_queue)
  
  # Break the loop if the work queue is empty
  break if test.nil?

  # Sanitize test name for filename
  safe_test_name = test.gsub(/[^\w\-]/, '_')
  log_file = "/tmp/#{safe_test_name}.log"
  
  # Run the test using bundle exec cucumber
  command = "bundle exec cucumber #{test}"
  stdout, stderr, status = Open3.capture3(command)

  # Write output and errors to log file
  File.open(log_file, 'w') do |file|
    file.puts "COMMAND: #{command}"
    file.puts "\n--- STDOUT ---\n"
    file.puts stdout
    file.puts "\n--- STDERR ---\n"
    file.puts stderr
    file.puts "\n--- STATUS ---\n"
    file.puts status.exitstatus
  end

  # Determine S3 key based on success or failure
  s3_subdir = status.success? ? "output" : "errors"
  s3_key = "feature-test-runs/#{release}/artefacts/#{s3_subdir}/#{safe_test_name}.log"

  begin
    s3.put_object(bucket: bucket, key: s3_key, body: File.open(log_file))
    puts "📤 Uploaded log to s3://#{bucket}/#{s3_key}"
  rescue Aws::S3::Errors::ServiceError => e
    puts "❌ Failed to upload log: #{e.message}"
  end
end

puts "✅ Work queue is empty. Script finished."