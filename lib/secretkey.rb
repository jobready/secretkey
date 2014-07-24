require 'digest'

module SecretKey
  class SecretKey
    def self.generate_token(key, secret, time_stamp)
      raise ArgumentError, 'Time Stamp is not a valid integer.' unless time_stamp.is_a? Integer
      Digest::SHA1.hexdigest("#{key}:#{secret}:#{time_stamp}")
    end
  end
end