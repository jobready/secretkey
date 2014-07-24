require 'digest'

module SecretKey
  class SecretKey

    def initialize(key, secret, options={})
      @key = key
      @secret = secret
      @options = options

      extract_options!
    end

    def token
      raise ArgumentError, 'Time Stamp is not a valid integer.' unless @timestamp.is_a? Integer
      Digest::SHA1.hexdigest("#{@key}:#{@secret}:#{@timestamp}")
    end

    def timestamp
      @timestamp ||= Time.now.to_i
    end

    private

    def extract_options!
      @timestamp = @options.fetch(:timestamp, timestamp)
    end
  end
end