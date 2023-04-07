# File: lib/time_error.rb

require 'date'
require 'json'
require 'net/http'

class TimeError
  # Returns difference in seconds between server time
  # and the time on this computer

  def initialize(getter, timer)
    # Inject dependencies to be able to test using doubles
    # @getter uses the Net::HTTP.get method in #get_server_time
    # @timer uses the Time.now method in #error
    @getter = getter
    @timer = timer
  end

  def error
    # Returns the difference between two time objects
    return get_server_time - @timer.now
  end

  private

  def get_server_time
    # Returns a Time object
    text_response = @getter.get(URI("https://worldtimeapi.org/api/ip"))
    json = JSON.parse(text_response)
    return DateTime.parse(json["utc_datetime"]).to_time
  end

end
