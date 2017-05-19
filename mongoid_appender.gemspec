require File.expand_path('../lib/mongoid_appender', __FILE__)

Gem::Specification.new do |spec|
  spec.name          = 'mongoid_appender'
  spec.version       = MongoidAppender::VERSION
  spec.authors       = ['Jonathan Wong']
  spec.email         = ['jonathan@armchairtheorist.com']
  spec.summary       = "Simple implementation of a logging appender for Tim Pease's Logging framework using Mongoid."
  spec.homepage      = 'https://github.com/armchairtheorist/mongoid_appender'
  spec.license       = 'MIT'

  spec.files         = Dir['{lib}/**/*.rb']
  spec.require_paths = ['lib']

  spec.add_dependency 'logging', '>= 1.8.0'
  spec.add_dependency 'mongoid', '>= 3.0.0'
end
