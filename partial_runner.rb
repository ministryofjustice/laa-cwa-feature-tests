# partial_runner.rb

# ensures that the output to the standard output (STDOUT) is flushed immediately
STDOUT.sync = true

require 'open3'

# Method to read feature files from a given file
def read_feature_files(file)
  File.readlines(file).map(&:chomp)
end

# Method to run cucumber command for a feature file
def run_cucumber(feature_file)
  stdout, stderr, status = Open3.capture3("bundle exec cucumber #{feature_file}")
  { stdout: stdout, stderr: stderr, status: status }
end

# Method to output the results of the cucumber command
def output_results(feature_file, results)
  puts "Running: bundle exec cucumber #{feature_file}"
  puts "Output:\n#{results[:stdout]}"
  puts "Errors:\n#{results[:stderr]}" unless results[:stderr].empty?
  puts "Exit Status: #{results[:status].exitstatus}"
  puts "-" * 40
end

# Method to parse the scenario, passed, and failed values from the output
def parse_scenarios(output)
  scenarios = output.scan(/(\d+) scenario/).flatten.map(&:to_i).sum
  passed = output.scan(/(\d+) passed/).flatten.map(&:to_i).sum
  failed = output.scan(/The scenario '.*' failed/).size
  { scenarios: scenarios, passed: passed, failed: failed }
end

# Main method to execute the script
def main
  feature_files = read_feature_files('features.txt')
  total_scenarios = 0
  total_passed = 0
  total_failed = 0

  feature_files.each do |feature_file|
    results = run_cucumber(feature_file)
    output_results(feature_file, results)
    
    parsed_results = parse_scenarios(results[:stdout])
    total_scenarios += parsed_results[:scenarios]
    total_passed += parsed_results[:passed]
    total_failed += parsed_results[:failed]
  end

  puts "Total Scenarios: #{total_scenarios}"
  puts "Total Passed: #{total_passed}"
  puts "Total Failed: #{total_failed}"
end

# Execute the main method
main