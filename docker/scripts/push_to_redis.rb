require 'redis'

RELEASE_NAME = File.read('release_name.txt').strip
REDIS_SERVICE = "#{RELEASE_NAME}-redis-service"
redis = Redis.new(host: REDIS_SERVICE, port: 6379)

if File.exist?('features.txt') && !File.zero?('features.txt')
  File.readlines('features.txt').each do |line|
    redis.lpush('mylist', line.strip)
  end
else
  feature_files = `find . -type f -name "*.feature"`.split("\n")
  feature_files.each do |file|
    redis.lpush('mylist', file)
  end
end

#sleep for 30 secs so the pod doesn't end too quickly
sleep 30