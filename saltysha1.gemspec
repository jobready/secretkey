# encoding: utf-8
lib = File.expand_path('../lib', __FILE__)
$:.unshift(lib) unless $:.include?(lib)

require 'saltysha1/version'

Gem::Specification.new do |spec|
  spec.name          = "saltysha1"
  spec.version       = SaltySHA1::VERSION
  spec.authors       = ["Dinusha Bodhinayake"]
  spec.email         = ["dinushab@jobready.com.au"]
  spec.description   = "Converts a unique identifier, salt string and timestamp into a SHA1 hash"
  spec.summary       = "Converts a unique identifier, salt string and timestamp into a SHA1 hash"
  spec.homepage      = "https://github.com/jobready/saltysha1"
  spec.license       = "MIT"
  
  spec.files         = `git ls-files`.split("\n")
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rspec"
  spec.add_development_dependency "faker"
  spec.add_development_dependency "factory_girl"
  spec.add_development_dependency "simplecov"

end