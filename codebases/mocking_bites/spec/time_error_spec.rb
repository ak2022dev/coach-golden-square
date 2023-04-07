# File: spec/time_error_spec.rb

require 'time'
require "time_error"

RSpec.describe TimeError do
  it "uses #error to return the difference between two times" do
    # Need to create an instance of TimeError injected with two doubles
    # Use a double to model use of Net::HTTP class
    fake_getter = double :getter
    # Set fake return value using curl in terminal
    fake_getter_return = '{"abbreviation":"BST","client_ip":"2a02:c7c:64ac:ee00:da66:7d07:e40f:eb83","datetime":"2023-04-06T14:50:02.655012+01:00","day_of_week":4,"day_of_year":96,"dst":true,"dst_from":"2023-03-26T01:00:00+00:00","dst_offset":3600,"dst_until":"2023-10-29T01:00:00+00:00","raw_offset":0,"timezone":"Europe/London","unixtime":1680789002,"utc_datetime":"2023-04-06T13:50:02.655012+00:00","utc_offset":"+01:00","week_number":14}' 
    # Extract fake world time from the above
    fake_world_time = Time.parse("2023-04-06T14:50:02.655012+01:00")
    # Setup fake method to model use of Net::HTTP.get
    expect(fake_getter).to receive(:get).with(URI("https://worldtimeapi.org/api/ip")).and_return(fake_getter_return)
    # Use a double to model an instance of Time class
    fake_timer = double :timer
    # Set fake return value using a call to Time.now in irb
    fake_now_time = Time.parse("2023-04-06 11:12:25.198914138 +0100")
    # Setup fake method to model use of Time.now
    expect(fake_timer).to receive(:now).and_return(fake_now_time)
    # Initialise a TimeError instance injecting above doubles
    time_error = TimeError.new(fake_getter, fake_timer)
    error_value = time_error.error
    expect(error_value).to eq(fake_world_time - fake_now_time)
  end
end
