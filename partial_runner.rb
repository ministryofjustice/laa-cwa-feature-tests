# partial_runner.rb

require 'open3'

# Read the list of feature files from features.txt
feature_files = File.readlines('features.txt').map(&:chomp)

feature_files.each do |feature_file|
  # Run the command for each feature file
  stdout, stderr, status = Open3.capture3("bundle exec cucumber #{feature_file}")

  # Output the results
  puts "Running: bundle exec cucumber #{feature_file}"
  puts "Output:\n#{stdout}"
  puts "Errors:\n#{stderr}" unless stderr.empty?
  puts "Exit Status: #{status.exitstatus}"
  puts "-" * 40
end