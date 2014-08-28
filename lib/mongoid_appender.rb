require "logging"
require "mongoid"

class MongoidAppender < Logging::Appender

	VERSION = "0.0.3"

	class Log
		include Mongoid::Document
		include Mongoid::Timestamps::Created

		store_in collection: "logs"

		field :level,		type: String
		field :logger,		type: String
		field :message,		type: String
		field :exception,	type: String
		field :backtrace,	type: Array

		index({ level: 1})
		index({ logger: 1})
		index({ exception: 1})
	end

	def initialize (name, opts = {})
    	super(name, opts)
 	end

	def write (event)
		if event.instance_of?(Logging::LogEvent)
			if event.data.is_a?(Exception)
				Log.create!(
					level: Logging::LNAMES[event.level],
					logger: event.logger,
					message: event.data.message,
					exception: event.data.class.to_s,
					backtrace: event.data.backtrace
				)
			else
				Log.create!(
					level: Logging::LNAMES[event.level],
					logger: event.logger,
					message: event.data.to_s
				)
			end
		else
			Log.create!(message: event.to_s)
		end
	end
end