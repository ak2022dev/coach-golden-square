# file: music_library.rb

class MusicLibrary

  def initialize
    @tracks = []   # an array of Track objects
  end

  def add(track) # track is an instance of Track
    # track gets added to the library
    # returns nothing
    @tracks << track
  end

  def all
    # returns array of track objects
    @tracks
  end

  def search(keyword) # keyword is a string
    # returns a list of tracks that match the keyword
    matching_tracks = []
    @tracks.each do |track|
      if track.matches?(keyword)
        matching_tracks << track
      end
    end
    return matching_tracks
  end

end