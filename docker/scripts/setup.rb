require 'net/http'
require 'redis'
require 'json'

GITHUB_REPO = "ministryofjustice/laa-cwa-feature-tests"
REDIS_HOST = ENV['REDIS_HOST']
REDIS_PORT = 6379
REDIS_LIST_NAME = "features_list"

def get_github_file(commit_sha, file_path)
  url = URI("https://raw.githubusercontent.com/#{GITHUB_REPO}/#{commit_sha}/#{file_path}")
  response = Net::HTTP.get_response(url)
  return response.body if response.is_a?(Net::HTTPSuccess)
  nil
end

def push_to_redis(data)
  redis = Redis.new(host: REDIS_HOST, port: REDIS_PORT)
  data.each { |item| redis.rpush(REDIS_LIST_NAME, item) }
end

def get_github_directory(commit_sha, dir_path)
  url = URI("https://api.github.com/repos/#{GITHUB_REPO}/contents/#{dir_path}?ref=#{commit_sha}")
  response = Net::HTTP.get_response(url)
  return JSON.parse(response.body) if response.is_a?(Net::HTTPSuccess)
  []
end

def verify_redis_list(expected_count)
  redis = Redis.new(host: REDIS_HOST, port: REDIS_PORT)
  actual_count = redis.llen(REDIS_LIST_NAME)
  if actual_count == expected_count
    puts "Verification successful: Redis list contains #{actual_count} items."
  else
    puts "Verification failed: Expected #{expected_count} items, but found #{actual_count} items in Redis list."
  end
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

def main(commit_sha)
  raise "COMMIT_SHA environment variable is not set" if commit_sha.nil? || commit_sha.empty?

  features_txt = get_github_file(commit_sha, "features.txt")
  if features_txt
    features_list = features_txt.strip.split("\n")
    unless features_list.empty?
      push_to_redis(features_list)
      puts "Data from features.txt pushed to Redis."
      verify_redis_list(features_list.size)
      return
    end
  end

  feature_files = find_feature_files(commit_sha, "features")
  unless feature_files.empty?
    push_to_redis(feature_files)
    puts "Data from *.feature files pushed to Redis. Number of files: #{feature_files.size}"
    verify_redis_list(feature_files.size)
    return
  end

  puts "No data to push to Redis."
end

commit_sha = ENV['COMMIT_SHA']
main(commit_sha)