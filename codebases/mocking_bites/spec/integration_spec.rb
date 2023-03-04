# file: spec/integration_spec.rb

require "track"
require "music_library"


RSpec.describe MusicLibrary do
  it "starts off empty" do
    music_lib = MusicLibrary.new
    expect(music_lib.all).to eq([])
  end
  it "adds a track" do
    music_lib = MusicLibrary.new
    track = Track.new("Harbour Lights","The Platters")
    music_lib.add(track)
    expect(music_lib.all).to include(track)
  end
  it "adds more than one track" do
    music_lib = MusicLibrary.new
    track1 = Track.new("Harbour Lights", "The Platters")
    track2 = Track.new("Lipstick on Your Collar", "Connie Francis")
    music_lib.add(track1)
    music_lib.add(track2)
    expect(music_lib.all).to include(track1)
    expect(music_lib.all).to include(track2)
  end
  it "finds one matching track" do
    music_lib = MusicLibrary.new
    track1 = Track.new("Harbour Lights", "The Platters")
    track2 = Track.new("Lipstick on Your Collar", "Connie Francis")
    music_lib.add(track1)
    music_lib.add(track2)
    matches = music_lib.search("Harbour")
    expect(matches).to include(track1)
    expect(matches).not_to include(track2)
  end
  it "finds one matching track" do
    music_lib = MusicLibrary.new
    track1 = Track.new("Harbour Lights", "The Platters")
    track2 = Track.new("Lipstick on Your Collar", "Connie Francis")
    music_lib.add(track1)
    music_lib.add(track2)
    matches = music_lib.search("Lipstick")
    expect(matches).to include(track2)
    expect(matches).not_to include(track1)
  end
  it "reports no matching track or artist" do
    music_lib = MusicLibrary.new
    track1 = Track.new("Harbour Lights", "The Platters")
    track2 = Track.new("Lipstick on Your Collar", "Connie Francis")
    music_lib.add(track1)
    music_lib.add(track2)
    matches = music_lib.search("Heart")
    expect(matches).to be_empty
  end
  it "finds more than one matching track" do
    music_lib = MusicLibrary.new
    track1 = Track.new("Love story", "Taylor Swift")
    track2 = Track.new("Lipstick on Your Collar", "Connie Francis")
    track3 = Track.new("Love", "Lana Del Ray")
    music_lib.add(track1)
    music_lib.add(track2)
    music_lib.add(track3)
    matches = music_lib.search("Love")
    expect(matches).to include(track1)
    expect(matches).to include(track3)
  end
  it "finds more than one matching track" do
    music_lib = MusicLibrary.new
    track1 = Track.new("Lipstick on Your Collar", "Connie Francis")
    track2 = Track.new("Love story", "Taylor Swift")
    track3 = Track.new("Love", "Lana Del Ray")
    music_lib.add(track1)
    music_lib.add(track2)
    music_lib.add(track3)
    matches = music_lib.search("Love")
    expect(matches).to include(track3)
    expect(matches).to include(track2)
  end
  it "finds one matching artist" do
    music_lib = MusicLibrary.new
    track1 = Track.new("Harbour Lights", "The Platters")
    track2 = Track.new("Lipstick on Your Collar", "Connie Francis")
    music_lib.add(track1)
    music_lib.add(track2)
    matches = music_lib.search("Platters")
    expect(matches).to include(track1)
    expect(matches).not_to include(track2)
  end
  it "finds one matching artist" do
    music_lib = MusicLibrary.new
    track1 = Track.new("Harbour Lights", "The Platters")
    track2 = Track.new("Lipstick on Your Collar", "Connie Francis")
    music_lib.add(track1)
    music_lib.add(track2)
    matches = music_lib.search("Connie Francis")
    expect(matches).not_to include(track1)
    expect(matches).to include(track2)
  end
  it "finds more than one matching artist" do
    music_lib = MusicLibrary.new
    track1 = Track.new("Lipstick on Your Collar", "Connie Francis")
    track2 = Track.new("Heart of Glass", "Blondie")
    track3 = Track.new("Sunday Girl", "Blondie")
    music_lib.add(track1)
    music_lib.add(track2)
    music_lib.add(track3)
    matches = music_lib.search("Blondie")
    expect(matches).to include(track2)
    expect(matches).to include(track3)
    expect(matches).not_to include(track1)
  end
end
