# file: spec/music_library_spec.rb

require "music_library"

RSpec.describe MusicLibrary do
  it "starts off empty" do
    music_lib = MusicLibrary.new
    expect(music_lib.all).to eq({})
  end
  xit "adds a track" do
    music_lib = MusicLibrary.new
    track = Track.new("Harbour Lights","The Platters")
    music_lib.add(track)
    expect(music_lib.all).to include("Harbour Lights" => "The Platters")
  end
end
