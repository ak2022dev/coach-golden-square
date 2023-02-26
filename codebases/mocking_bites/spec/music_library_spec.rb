# file: spec/music_library_spec.rb

require "music_library"

RSpec.describe MusicLibrary do
  it "starts off empty" do
    music_lib = MusicLibrary.new
    expect(music_lib.all).to eq({})
  end
  it "adds a track" do
    music_lib = MusicLibrary.new
    track = Track.new("Harbour Lights","The Platters")
    music_lib.add(track)
    expect(music_lib.all).to include("Harbour Lights" => "The Platters")
  end
  it "adds more than one track" do
    music_lib = MusicLibrary.new
    track1 = Track.new("Harbour Lights", "The Platters")
    track2 = Track.new("Lipstick on Your Collar", "Connie Francis")
    music_lib.add(track1)
    music_lib.add(track2)
    expect(music_lib.all).to include("Harbour Lights" => "The Platters")
    expect(music_lib.all).to include("Lipstick on Your Collar" => "Connie Francis")
  end
  it "finds one matching track" do
    music_lib = MusicLibrary.new
    track1 = Track.new("Harbour Lights", "The Platters")
    track2 = Track.new("Lipstick on Your Collar", "Connie Francis")
    music_lib.add(track1)
    music_lib.add(track2)
    matches = music_lib.search("Harbour")
    expect(matches).to include("Harbour Lights" => "The Platters")
    expect(matches).not_to include("Lipstick on Your Collar" => "Connie Francis")
  end
end

