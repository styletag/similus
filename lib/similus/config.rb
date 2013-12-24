module Similus
  def self.config
    @config ||= Config.new
    block_given? ? yield(@config) : @config
  end
  
  class Config
    attr_accessor :backend
    attr_accessor :redis_server
    attr_accessor :redis_port
    attr_accessor :redis_db
    attr_accessor :redis_cache_server
    attr_accessor :redis_cache_port
    attr_accessor :redis_cache_db
    attr_accessor :logfile
    attr_accessor :redis_driver

    def initialize #:nodoc:
      self.backend      = :redis
      self.redis_server = "localhost"
      self.redis_port = "6379"
      self.redis_db     = 9
      self.redis_cache_server = "localhost"
      self.redis_cache_port = "6379"
      self.redis_cache_db     = 9
      self.logfile      = STDOUT
      self.redis_driver = nil
    end

    def logger
      @logger ||= Logger.new(logfile)
    end
  end
end
