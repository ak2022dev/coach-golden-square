# file: spec/music_library_spec.rb

require "music_library"

RSpec.describe MusicLibrary do
  it "starts off empty" do
    music_lib = MusicLibrary.new
    expect(music_lib.all).to eq([])
  end
end
