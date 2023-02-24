# file: lib/track.rb

class Track

  attr_reader :title, :artist

  def initialize(title, artist) # title and artist are both strings
    @title = title
    @artist = artist
  end

  def matches?(keyword) # keyword is a string
  end
  
end