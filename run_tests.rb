require 'redis'
require 'logger'

logger = Logger.new($stdout) # create a new logger that writes to the console
#logger = Logger.new('/opt/logs.txt')
logger.datetime_format = '%d-%m-%Y %H:%M:%S'

logger.info('Starting application...')
logger.info('Configuring Redis...')
redis = Redis.new(host: ENV["REDIS_SERVICE_HOST"], port: 6379)

n = 50
n.times do
    logger.info('Reading from Redis wq...')
    ft = redis.lpop("ft")
    if ft.nil? || ft.empty?
        logger.info("Redis workqueue empty...ending")
        break
    end
    logger.info("Running bundle exec cucumber #{ft}")
    #cmd = "bundle exec cucumber #{ft}"
    #value = `#{cmd}`
    #logger.info(value)
    sleep(10)
end
logger.info("Work complete...ending")
