require "mongoid_appender"

Gem::Specification.new do |spec|
  spec.name          = "mongoid_appender"
  spec.version       = MongoidAppender::VERSION
  spec.authors       = ["Jonathan Wong"]
  spec.email         = ["jonathan@armchairtheorist.com"]
  spec.summary       = "Simple implementation of a standard logging appender to write log messages into MongoDB using Mongoid."
  spec.description   = "Simple implementation of a standard logging appender to write log messages into MongoDB using Mongoid."
  spec.homepage      = "http://github.com/armchairtheorist/mongoid_appender"
  spec.license       = "MIT"

  spec.files         = Dir["{lib}/**/*.rb"]
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_runtime_dependency "logging"
  spec.add_runtime_dependency "mongoid"
end