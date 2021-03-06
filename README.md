[![Gem Version](https://badge.fury.io/rb/mongoid_appender.svg)](https://badge.fury.io/rb/mongoid_appender)
[![Code Climate](https://codeclimate.com/github/armchairtheorist/mongoid_appender/badges/gpa.svg)](https://codeclimate.com/github/armchairtheorist/mongoid_appender)

# MongoidAppender

MongoidAppender is a simple implementation of a standard `Logging::Appender` for Tim Pease's [Logging](http://github.com/TwP/logging) framework using [Mongoid](http://www.mongoid.org), useful for writing log messages into MongoDB. MongoidAppender has been tested with both Mongoid 3.x and 4.0.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mongoid_appender'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mongoid_appender

## Usage

Configure MongoidAppender as you would a normal `Logging::Appender`. For example, to configure your root logger to output all messages to `stdout` but only write `:warn` messages and above to MongoDB, you can use the following code:

```ruby
require 'logging'
require 'mongoid'

# Some code to set up Mongoid here...

Logging.logger.root.add_appenders(
    Logging.appenders.stdout,
	MongoidAppender.new('mongoid', :level => :warn)
)
```

By default, MongoidAppender will write log documents into a MongoDB collection named `logs`. Every document has the following fields:

* `level` - The event level (debug, info, warn, error, etc.)
* `logger` - The name of the logger
* `message` - The log message
* `exception` - The log exception (if any)
* `backtrace` - The log backtrace (if any)

Simple!
