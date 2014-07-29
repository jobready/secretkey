require 'digest'

module SecretKey
  class SecretKey
    attr_reader :key, :secret, :timestamp

    def initialize(key, secret, timestamp: Time.now.to_i)
      @key = key
      @secret = secret
      @timestamp = timestamp
    end

    def token
      raise ArgumentError, 'Time Stamp is not a valid integer.' unless timestamp.is_a? Integer
      Digest::SHA1.hexdigest("#{key}:#{secret}:#{timestamp}")
    end
  end
end
