# file: music_library.rb

class MusicLibrary

  def initialize
    @tracks = {}
  end

  def add(track) # track is an instance of Track
    # track gets added to the library
    # returns nothing
  end

  def all
    # returns list of track objects
    @tracks
  end

  def search(keyword) # keyword is a string
    # returns a list of tracks that match the keyword
  end

end