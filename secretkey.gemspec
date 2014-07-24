# encoding: utf-8
lib = File.expand_path('../lib', __FILE__)
$:.unshift(lib) unless $:.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "secretkey"
  spec.version       = '1.0.0'
  spec.authors       = ["Dinusha Bodhinayake"]
  spec.email         = ["dinushab@jobready.com.au"]
  spec.description   = "Generates a unique token based on application key, application secret and timestamp"
  spec.summary       = "Generates a unique token based on application key, application secret and timestamp"
  spec.homepage      = "https://github.com/jobready/secretkey"
  spec.license       = "MIT"
  
  spec.files         = `git ls-files`.split("\n")

  spec.add_development_dependency "rspec"
  spec.add_development_dependency "faker"
  spec.add_development_dependency "simplecov"
  spec.add_development_dependency "byebug"
end