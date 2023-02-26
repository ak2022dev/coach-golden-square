# file: spec/track_spec.rb

require "track"

RSpec.describe Track do
  it "Remembers a song title" do
    track = Track.new("Harbour Lights", "The Platters")
    title = track.title
    expect(title).to eq("Harbour Lights")
  end
  it "Remembers a song's artist" do
    track = Track.new("Harbour Lights", "The Platters")
    artist = track.artist
    expect(artist).to eq("The Platters")
  end
  it "Checks if a track matches based on keyword in title" do
    track = Track.new("Harbour Lights", "The Platters")
    match = track.matches?("Harbour")
    expect(match).to be(true)
  end
  it "Checks if a track matches based on keyword in title" do
    track = Track.new("Harbour Lights", "The Platters")
    match = track.matches?("Lights")
    expect(match).to be(true)
  end
  it "Checks if a track doesn't match keyword in either title or artist" do
    track = Track.new("Harbour Lights", "The Platters")
    match = track.matches?("Nights")
    expect(match).to be(false)
  end
  it "Checks if a track matches based on keyword in artist" do
    track = Track.new("Harbour Lights", "The Platters")
    match = track.matches?("Platters")
    expect(match).to be(true)
  end
end

