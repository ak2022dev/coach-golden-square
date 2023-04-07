require 'net/http'
require 'time'
require_relative 'time_error'

getter = Net::HTTP
timer = Time

time_error = TimeError.new(Net::HTTP, timer)
puts time_error.error
