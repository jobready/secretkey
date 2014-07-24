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
    str_time_stamp = time_stamp.strftime('%Y%m%d%H%M')
    Digest::SHA1.hexdigest("#{key}:#{secret}:#{str_time_stamp}")
  end

end