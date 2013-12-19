module Similus
  def self.redis
    @redis ||= begin
      host = config.redis_server
      port = config.redis_port
      driver = config.redis_driver
      if driver           
        ::Redis.new(:host => host, :port => port, :db => config.redis_db, :driver => driver)
      else
        ::Redis.new(:host => host, :port => port, :db => config.redis_db)
      end
    rescue Exception => e
      config.logger.error "Error connecting redis server: #{e.message}"
      nil
    end
  end
  
  def self.clear_database!
    @cache = {}
    redis.flushdb
  end
end
