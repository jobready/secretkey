require 'digest'

class SecretKey

  module Version
    version = Gem::Specification.load(File.expand_path("../secretkey.gemspec", File.dirname(__FILE__))).version.to_s.split(".").map { |i| i.to_i }
    MAJOR = version[0]
    MINOR = version[1]
    PATCH = version[2]
    STRING = "#{MAJOR}.#{MINOR}.#{PATCH}"
  end

  VERSION = Version::STRING

  def self.generate_token(key, secret, time_stamp)
    raise ArgumentError, 'Time Stamp is not a valid integer.' unless time_stamp.is_a? Integer
    Digest::SHA1.hexdigest("#{key}:#{secret}:#{time_stamp}")
  end

end