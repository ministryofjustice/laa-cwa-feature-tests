# setup.rb
require 'net/http'
require 'redis'
require 'json'

GITHUB_REPO = "ministryofjustice/laa-cwa-feature-tests"
REDIS_HOST = ENV['REDIS_SERVICE']
REDIS_LIST_NAME = "features_list"

def get_github_file(commit_sha, file_path)
  url = URI("https://raw.githubusercontent.com/#{GITHUB_REPO}/#{commit_sha}/#{file_path}")
  response = Net::HTTP.get_response(url)
  if response.is_a?(Net::HTTPSuccess)
    response.body
  else
    puts "Failed to fetch file from GitHub: #{response.message}"
    nil
  end
end

def test_redis_connection
  redis = Redis.new(url: redis_service)
  begin
    redis.ping
    puts "Connected to Redis successfully."
  rescue => e
    puts "Failed to connect to Redis: #{e.message}"
  end
end

def push_to_redis(data)
  test_redis_connection()
  print_redis_list()
  redis = Redis.new(url: redis_service)
  data.each do |item|
    puts "Pushing item to Redis: #{item}"
    redis.rpush(REDIS_LIST_NAME, item)
  end
  print_redis_list()
end

def print_redis_list
  redis = Redis.new(url: redis_service)
  list_content = redis.lrange(REDIS_LIST_NAME, 0, -1)
  puts "Examining Redis list state, REDIS_LIST_NAME: #{REDIS_LIST_NAME}"
  puts "Current Redis list content: #{list_content}"
end

def get_github_directory(commit_sha, dir_path)
  url = URI("https://api.github.com/repos/#{GITHUB_REPO}/contents/#{dir_path}?ref=#{commit_sha}")
  response = Net::HTTP.get_response(url)
  puts response
  return JSON.parse(response.body) if response.is_a?(Net::HTTPSuccess)
  []
end

def find_feature_files(commit_sha, dir_path)
  files = get_github_directory(commit_sha, dir_path)
  feature_files = []

  files.each do |file|
    if file['type'] == 'file' && file['name'].end_with?('.feature')
      feature_files << file['path']
    elsif file['type'] == 'dir'
      feature_files.concat(find_feature_files(commit_sha, file['path']))
    end
  end

  feature_files
end

def verify_redis_list(expected_count)
  redis = Redis.new(url: redis_service)
  actual_count = redis.llen(REDIS_LIST_NAME)
  if actual_count == expected_count
    puts "Verification successful: Redis list contains #{actual_count} items."
  else
    puts "Verification failed: Expected #{expected_count} items, but found #{actual_count} items in Redis list."
  end
  actual_count
end

def write_count_to_file(count)
  File.open("/artifacts/feature_file_count.txt", "w") do |file|
    file.puts "Number of .feature files in Redis list: #{count}"
  end
end

def main(commit_sha)
  raise "COMMIT_SHA environment variable is not set" if commit_sha.nil? || commit_sha.empty?

  features_txt = get_github_file(commit_sha, "features.txt")
  if features_txt
    features_list = features_txt.strip.split("\n")
    unless features_list.empty?
      push_to_redis(features_list)
      puts "Data from features.txt pushed to Redis."
      count = verify_redis_list(features_list.size)
      write_count_to_file(count)
      return
    end
  end

  feature_files = find_feature_files(commit_sha, "features")
  unless feature_files.empty?
    push_to_redis(feature_files)
    puts "Data from *.feature files pushed to Redis. Number of files: #{feature_files.size}"
    count = verify_redis_list(feature_files.size)
    write_count_to_file(count)
    return
  end

  puts "No data to push to Redis."
end

commit_sha = ENV['COMMIT_SHA']
puts "REDIS_HOST: #{REDIS_HOST}"
puts "COMMIT_SHA: #{commit_sha}"
main(commit_sha)