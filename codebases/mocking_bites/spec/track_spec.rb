# file: spec/track_spec.rb

require "track"

RSpec.describe Track do
  it "Remembers a song title" do
    track = Track.new("Harbour Lights", "The Platters")
    title = track.title
    expect(title).to eq("Harbour Lights")
  end
end
