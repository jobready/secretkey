require 'digest'

module SecretKey
  class SecretKey
    def self.generate_token(key, secret, timestamp)
      raise ArgumentError, 'Time Stamp is not a valid integer.' unless timestamp.is_a? Integer
      Digest::SHA1.hexdigest("#{key}:#{secret}:#{timestamp}")
    end
  end
end