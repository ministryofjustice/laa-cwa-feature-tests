require 'net/http'
require 'redis'
require 'json'
require 'logger'
require 'digest'

GITHUB_REPO = "ministryofjustice/laa-cwa-feature-tests"
redis_service = ENV['REDIS_SERVICE']
REDIS_LIST_NAME = "features_list"
logger = Logger.new(STDOUT)
logger.level = Logger::DEBUG

# Simple in-memory cache
$cache = {}

def fetch_and_cache_directory_tree(commit_sha, root_dir, logger)
  url = URI("https://api.github.com/repos/#{GITHUB_REPO}/git/trees/#{commit_sha}?recursive=1")
  logger.debug("Fetching entire directory tree from URL: #{url}")
  response = Net::HTTP.get_response(url)
  if response.is_a?(Net::HTTPSuccess)
    logger.info("Successfully fetched directory tree from GitHub.")
    tree = JSON.parse(response.body)['tree']
    $cache[root_dir] = tree.select { |item| item['path'].start_with?(root_dir) }
  else
    logger.error("Failed to fetch directory tree from GitHub: #{response.message}")
    $cache[root_dir] = []
  end
end

def get_cached_directory_tree(root_dir, logger)
  if $cache.key?(root_dir)
    logger.debug("Cache hit for #{root_dir}")
    return $cache[root_dir]
  else
    logger.error("Cache miss for #{root_dir}")
    return []
  end
end

def get_github_file(commit_sha, file_path, logger)
  url = URI("https://raw.githubusercontent.com/#{GITHUB_REPO}/#{commit_sha}/#{file_path}")
  logger.debug("Fetching file from URL: #{url}")
  response = Net::HTTP.get_response(url)
  if response.is_a?(Net::HTTPSuccess)
    logger.info("Successfully fetched file from GitHub.")
    response.body
  else
    logger.error("Failed to fetch file from GitHub: #{response.message}")
    nil
  end
end

def test_redis_connection(redis_service, logger)
  redis = Redis.new(url: redis_service)
  begin
    redis.ping
    logger.info("Connected to Redis successfully.")
  rescue => e
    logger.error("Failed to connect to Redis: #{e.message}")
  end
end

def push_to_redis(data, redis_service, logger)
  test_redis_connection(redis_service, logger)
  print_redis_list(redis_service, logger)
  redis = Redis.new(url: redis_service)
  data.each do |item|
    logger.debug("Pushing item to Redis: #{item}")
    redis.rpush(REDIS_LIST_NAME, item)
  end
  print_redis_list(redis_service, logger)
end

def print_redis_list(redis_service, logger)
  redis = Redis.new(url: redis_service)
  list_content = redis.lrange(REDIS_LIST_NAME, 0, -1)
  logger.debug("Examining Redis list state, REDIS_LIST_NAME: #{REDIS_LIST_NAME}")
  logger.debug("Current Redis list content: #{list_content}")
end

def find_feature_files(commit_sha, root_dir, logger)
  fetch_and_cache_directory_tree(commit_sha, root_dir, logger)
  files = get_cached_directory_tree(root_dir, logger)
  feature_files = files.select { |file| file['type'] == 'blob' && file['path'].end_with?('.feature') }
  feature_files.map { |file| file['path'] }
end

def verify_redis_list(expected_count, redis_service, logger)
  redis = Redis.new(url: redis_service)
  actual_count = redis.llen(REDIS_LIST_NAME)
  if actual_count == expected_count
    logger.info("Verification successful: Redis list contains #{actual_count} items.")
  else
    logger.error("Verification failed: Expected #{expected_count} items, but found #{actual_count} items in Redis list.")
  end
  actual_count
end

def write_count_to_file(count, logger)
  logger.debug("Writing count to file: #{count}")
  File.open("/artifacts/feature_file_count.txt", "w") do |file|
    file.puts "Number of .feature files in Redis list: #{count}"
  end
end

def main(commit_sha, redis_service, logger)
  raise "COMMIT_SHA environment variable is not set" if commit_sha.nil? || commit_sha.empty?

  features_txt = get_github_file(commit_sha, "features.txt", logger)
  if features_txt
    features_list = features_txt.strip.split("\n")
    unless features_list.empty?
      push_to_redis(features_list, redis_service, logger)
      logger.info("Data from features.txt pushed to Redis.")
      count = verify_redis_list(features_list.size, redis_service, logger)
      write_count_to_file(count, logger)
      return
    end
  end

  feature_files = find_feature_files(commit_sha, "features", logger)
  unless feature_files.empty?
    push_to_redis(feature_files, redis_service, logger)
    logger.info("Data from *.feature files pushed to Redis. Number of files: #{feature_files.size}")
    count = verify_redis_list(feature_files.size, redis_service, logger)
    write_count_to_file(count, logger)
    return
  end

  logger.warn("No data to push to Redis.")
end

commit_sha = ENV['COMMIT_SHA']
logger.debug("REDIS_HOST: #{redis_service}")
logger.debug("COMMIT_SHA: #{commit_sha}")
sleep 30
main(commit_sha, redis_service, logger)
