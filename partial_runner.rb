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

# Method to parse the scenario, passed, failed, and steps values from the output
def parse_scenarios(output)
  scenarios = output.scan(/(\d+) scenario/).flatten.map(&:to_i).sum
  passed_scenarios = output.scan(/(\d+) scenario \(\d+ passed\)/).flatten.map(&:to_i).sum
  failed = output.scan(/The scenario '.*' failed/).size
  steps = output.scan(/(\d+) steps/).flatten.map(&:to_i).sum
  times = output.scan(/took (\d+\.\d+) seconds to run/).flatten.map(&:to_f)
  { scenarios: scenarios, passed_scenarios: passed_scenarios, failed: failed, steps: steps, times: times }
end

# Main method to execute the script
def main
  feature_files = read_feature_files('features.txt')
  total_scenarios = 0
  total_passed_scenarios = 0
  total_failed = 0
  total_steps = 0
  total_time = 0.0
  longest_time = 0.0
  longest_feature = ""
  failed_files = []

  feature_files.each do |feature_file|
    results = run_cucumber(feature_file)
    output_results(feature_file, results)
    
    parsed_results = parse_scenarios(results[:stdout])
    total_scenarios += parsed_results[:scenarios]
    total_passed_scenarios += parsed_results[:passed_scenarios]
    total_failed += parsed_results[:failed]
    total_steps += parsed_results[:steps]
    total_time += parsed_results[:times].sum

    # Check for the longest time
    if parsed_results[:times].max.to_f > longest_time
      longest_time = parsed_results[:times].max.to_f
      longest_feature = feature_file
    end

    # Add to failed_files if there are any failures
    failed_files << feature_file if parsed_results[:failed] > 0
  end

  puts "Total Scenarios: #{total_scenarios}"
  puts "Total Passed Scenarios: #{total_passed_scenarios}"
  puts "Total Failed: #{total_failed}"
  puts "Total Steps: #{total_steps}"
  puts "Total Time: #{(total_time / 60).round(2)} minutes"
  puts "Longest Running Feature: #{longest_feature} took #{longest_time} seconds"

  # Output the names of the failed feature files
  unless failed_files.empty?
    puts "Failed Feature Files:"
    failed_files.each { |file| puts file }
  end
end

# Execute the main method
main