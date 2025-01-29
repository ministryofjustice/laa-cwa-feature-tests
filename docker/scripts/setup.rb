require 'net/http'
require 'redis'
require 'json'

GITHUB_REPO = "ministryofjustice/laa-cwa-feature-tests"
REDIS_HOST = "redis-service"
REDIS_PORT = 6379
REDIS_LIST_NAME = "features_list"

def get_github_file(commit_sha, file_path)
  # Ensure commit_sha is the full 40-character SHA
  url = URI("https://raw.githubusercontent.com/#{GITHUB_REPO}/#{commit_sha}/#{file_path}")
  response = Net::HTTP.get_response(url)
  return response.body if response.is_a?(Net::HTTPSuccess)
  nil
end

def push_to_redis(data)
  redis = Redis.new(host: REDIS_HOST, port: REDIS_PORT)
  data.each { |item| redis.rpush(REDIS_LIST_NAME, item) }
end

def main(commit_sha)
  raise "COMMIT_SHA environment variable is not set" if commit_sha.nil? || commit_sha.empty?

  features_txt = get_github_file(commit_sha, "features.txt")
  if features_txt
    features_list = features_txt.strip.split("\n")
    unless features_list.empty?
      push_to_redis(features_list)
      puts "Data from features.txt pushed to Redis."
      return
    end
  end

  features_dir = URI("https://api.github.com/repos/#{GITHUB_REPO}/contents/features?ref=#{commit_sha}")
  response = Net::HTTP.get_response(features_dir)
  if response.is_a?(Net::HTTPSuccess)
    files = JSON.parse(response.body)
    feature_files = files.select { |file| file['name'].end_with?('.feature') }.map { |file| file['path'] }
    unless feature_files.empty?
      count = push_to_redis(feature_files)
      puts "Data from *.feature files pushed to Redis. Number of files: #{count}"
      return
    end
  end

  puts "No data to push to Redis."
end

commit_sha = ENV['COMMIT_SHA']
main(commit_sha)