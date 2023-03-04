# file: spec/music_library_spec.rb

require "music_library"


RSpec.describe MusicLibrary do
  it "starts off empty" do
    music_lib = MusicLibrary.new
    expect(music_lib.all).to eq([])
  end
  it "adds a track" do
    music_lib = MusicLibrary.new
    track = double(:fake_track, title: "Harbour Lights", artist: "The Platters")
    music_lib.add(track)
    expect(music_lib.all).to include(track)
  end
  it "adds more than one track" do
    music_lib = MusicLibrary.new
    track1 = double(:fake_track1, title: "Harbour Lights", artist: "The Platters")
    track2 = double(:fake_track2, title: "Lipstick on Your Collar", artist: "Connie Francis")
    music_lib.add(track1)
    music_lib.add(track2)
    expect(music_lib.all).to include(track1)
    expect(music_lib.all).to include(track2)
  end
  it "finds one matching track" do
    music_lib = MusicLibrary.new
    track1 = double(:fake_track1, title: "Harbour Lights", artist: "The Platters")
    track2 = double(:fake_track2, title: "Lipstick on Your Collar", artist: "Connie Francis")
    expect(track1).to receive(:matches?).with("Harbour").and_return(true)
    expect(track2).to receive(:matches?).with("Harbour").and_return(false)
    music_lib.add(track1)
    music_lib.add(track2)
    matches = music_lib.search("Harbour")
    expect(matches).to include(track1)
    expect(matches).not_to include(track2)
  end
  it "finds one matching track" do
    music_lib = MusicLibrary.new
    track1 = double(:fake_track1, title: "Harbour Lights", artist: "The Platters")
    track2 = double(:fake_track2, title: "Lipstick on Your Collar", artist: "Connie Francis")
    expect(track1).to receive(:matches?).with("Lipstick").and_return(false)
    expect(track2).to receive(:matches?).with("Lipstick").and_return(true)    
    music_lib.add(track1)
    music_lib.add(track2)
    matches = music_lib.search("Lipstick")
    expect(matches).to include(track2)
    expect(matches).not_to include(track1)
  end
  it "reports no matching track or artist" do
    music_lib = MusicLibrary.new
    track1 = double(:fake_track1, title: "Harbour Lights", artist: "The Platters")
    track2 = double(:fake_track2, title: "Lipstick on Your Collar", artist: "Connie Francis")
    expect(track1).to receive(:matches?).with("Heart").and_return(false)
    expect(track2).to receive(:matches?).with("Heart").and_return(false)    
    music_lib.add(track1)
    music_lib.add(track2)
    matches = music_lib.search("Heart")
    expect(matches).to be_empty
  end
  it "finds more than one matching track" do
    music_lib = MusicLibrary.new
    track1 = double(:fake_track1, title: "Love story", artist: "Taylor Swift")
    track2 = double(:fake_track2, title: "Lipstick on Your Collar", artist: "Connie Francis")
    track3 = double(:fake_track3, title: "Love", artist: "Lana Del Ray")
    expect(track1).to receive(:matches?).with("Love").and_return(true)
    expect(track2).to receive(:matches?).with("Love").and_return(false)    
    expect(track3).to receive(:matches?).with("Love").and_return(true)
    music_lib.add(track1)
    music_lib.add(track2)
    music_lib.add(track3)
    matches = music_lib.search("Love")
    expect(matches).to include(track1)
    expect(matches).not_to include(track2)
    expect(matches).to include(track3)
  end
  it "finds one matching artist" do
    music_lib = MusicLibrary.new
    track1 = double(:fake_track1, title: "Harbour Lights", artist: "The Platters")
    track2 = double(:fake_track2, title: "Lipstick on Your Collar", artist: "Connie Francis")
    expect(track1).to receive(:matches?).with("Platters").and_return(true)
    expect(track2).to receive(:matches?).with("Platters").and_return(false)    
    music_lib.add(track1)
    music_lib.add(track2)
    matches = music_lib.search("Platters")
    expect(matches).to include(track1)
    expect(matches).not_to include(track2)
  end
  it "finds one matching artist" do
    music_lib = MusicLibrary.new
    track1 = double(:fake_track1, title: "Harbour Lights", artist: "The Platters")
    track2 = double(:fake_track2, title: "Lipstick on Your Collar", artist: "Connie Francis")
    expect(track1).to receive(:matches?).with("Connie").and_return(false)
    expect(track2).to receive(:matches?).with("Connie").and_return(true)    
    music_lib.add(track1)
    music_lib.add(track2)
    matches = music_lib.search("Connie")
    expect(matches).not_to include(track1)
    expect(matches).to include(track2)
  end
  it "finds more than one matching artist" do
    music_lib = MusicLibrary.new
    track1 = double(:fake_track1, title: "Heart of Glass", artist: "Blondie")
    track2 = double(:fake_track2, title: "Sunday Girl", artist: "Blondie")
    track3 = double(:fake_track3, title: "Lipstick on Your Collar", artist: "Connie Francis")
    expect(track1).to receive(:matches?).with("Blondie").and_return(true)
    expect(track2).to receive(:matches?).with("Blondie").and_return(true)    
    expect(track3).to receive(:matches?).with("Blondie").and_return(false)    
    music_lib.add(track1)
    music_lib.add(track2)
    music_lib.add(track3)
    matches = music_lib.search("Blondie")
    expect(matches).to include(track1)
    expect(matches).to include(track2)
    expect(matches).not_to include(track3)
  end
end
