# file: lib/track.rb

class Track

  attr_reader :title, :artist

  def initialize(title, artist) # title and artist are both strings
    @title = title    # title is a string
    @artist = artist  # artis is a string
  end

  def matches?(keyword) # keyword is a string
    @title.include?(keyword) || @artist.include?(keyword)
  end
  
end