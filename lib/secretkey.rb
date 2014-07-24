require 'digest'

module SecretKey
  class SecretKey

    attr_accessor :timestamp

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

    private

    def extract_options!
      @timestamp = @options.fetch(:timestamp, default_timestamp)
    end

    def default_timestamp
      @default_timestamp ||= Time.now.to_i
    end

  end
end