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
    expect(track2).to receive(:matches?).with("Harbour").and_return(false)
    expect(track1).to receive(:matches?).with("Harbour").and_return(true)
    music_lib.add(track1)
    music_lib.add(track2)
    matches = music_lib.search("Harbour")
    expect(matches).to include(track1)
    expect(matches).not_to include(track2)
  end
  xit "finds one matching track" do
    music_lib = MusicLibrary.new
    track1 = double(:fake_track1, title: "Harbour Lights", artist: "The Platters")
    track2 = double(:fake_track2, title: "Lipstick on Your Collar", artist: "Connie Francis")
    expect(track1).to receive(:matches?).with("Lipstick").and_return(false)
    expect(track2).to receive(:matches?).with("Lipstick").and_return(true)    
    music_lib.add(track1)
    p "music_lib is #{music_lib}"
    music_lib.add(track2)
    p "music_lib is #{music_lib}"
    matches = music_lib.search("Lipstick")
    p "matches is #{matches}"
    expect(matches).to include("Lipstick on Your Collar" => "Connie Francis")
    expect(matches).not_to include("Harbour Lights" => "The Platters")
  end
  xit "reports no matching track or artist" do
    music_lib = MusicLibrary.new
    track1 = Track.new("Harbour Lights", "The Platters")
    track2 = Track.new("Lipstick on Your Collar", "Connie Francis")
    music_lib.add(track1)
    music_lib.add(track2)
    matches = music_lib.search("Heart")
    expect(matches).to be_empty
  end
  xit "finds more than one matching track" do
    music_lib = MusicLibrary.new
    track1 = Track.new("Love story", "Taylor Swift")
    track2 = Track.new("Lipstick on Your Collar", "Connie Francis")
    track3 = Track.new("Love", "Lana Del Ray")
    music_lib.add(track1)
    music_lib.add(track2)
    music_lib.add(track3)
    matches = music_lib.search("Love")
    expect(matches).to include("Love story" => "Taylor Swift")
    expect(matches).to include("Love" => "Lana Del Ray")
  end
  xit "finds more than one matching track" do
    music_lib = MusicLibrary.new
    track1 = Track.new("Lipstick on Your Collar", "Connie Francis")
    track2 = Track.new("Love story", "Taylor Swift")
    track3 = Track.new("Love", "Lana Del Ray")
    music_lib.add(track1)
    music_lib.add(track2)
    music_lib.add(track3)
    matches = music_lib.search("Love")
    expect(matches).to include("Love" => "Lana Del Ray")
    expect(matches).to include("Love story" => "Taylor Swift")
  end
  xit "finds one matching artist" do
    music_lib = MusicLibrary.new
    track1 = Track.new("Harbour Lights", "The Platters")
    track2 = Track.new("Lipstick on Your Collar", "Connie Francis")
    music_lib.add(track1)
    music_lib.add(track2)
    matches = music_lib.search("Platters")
    expect(matches).to include("Harbour Lights" => "The Platters")
    expect(matches).not_to include("Lipstick on Your Collar" => "Connie Francis")
  end
  xit "finds one matching artist" do
    music_lib = MusicLibrary.new
    track1 = Track.new("Harbour Lights", "The Platters")
    track2 = Track.new("Lipstick on Your Collar", "Connie Francis")
    music_lib.add(track1)
    music_lib.add(track2)
    matches = music_lib.search("Connie Francis")
    expect(matches).not_to include("Harbour Lights" => "The Platters")
    expect(matches).to include("Lipstick on Your Collar" => "Connie Francis")
  end
  xit "finds more than one matching artist" do
    music_lib = MusicLibrary.new
    track1 = Track.new("Lipstick on Your Collar", "Connie Francis")
    track2 = Track.new("Heart of Glass", "Blondie")
    track3 = Track.new("Sunday Girl", "Blondie")
    music_lib.add(track1)
    music_lib.add(track2)
    music_lib.add(track3)
    matches = music_lib.search("Blondie")
    expect(matches).to include("Heart of Glass" => "Blondie")
    expect(matches).to include("Sunday Girl" => "Blondie")
    expect(matches).not_to include("Lipstick on Your Collar" => "Connie Francis")
  end
end
