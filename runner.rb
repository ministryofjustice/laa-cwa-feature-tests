require 'redis'
require 'open3'

# Access Redis service and work queue name from environment variables
redis_service = ENV['REDIS_SERVICE']
work_queue = ENV['WORK_Q']

# Connect to Redis
redis = Redis.new(url: redis_service)

loop do
  # Pop a test from the work queue
  test = redis.lpop(work_queue)
  
  # Break the loop if the work queue is empty
  break if test.nil?


  # Simulate running the test using sleep
  puts "Simulating test run for: #{test}"
  sleep(180)
  # Print a message indicating completion of the simulated test run
  puts "Completed simulated test run for: #{test}"
  
  # Run the test using bundle exec cucumber
  #command = "bundle exec cucumber #{test}"
  #stdout, stderr, status = Open3.capture3(command)

  # Print the output and error messages
  #puts stdout
  #puts stderr unless status.success?
end

puts "Work queue is empty. Script finished."
