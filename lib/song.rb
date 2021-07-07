class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name = nil, artist = nil)
    @name = name
    @artist_name = artist
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = self.new
    @@all << new_song
    new_song
  end

  def self.new_by_name(name)
    new_song = self.new(name)
    new_song
  end

  def self.create_by_name(name)
    new_song = self.new(name)
    @@all << new_song
    new_song
  end

  def self.find_by_name(name)
    self.all.each do |song|
      if song.name == name
        return song
      end
    end
    nil
  end

  def self.find_or_create_by_name(name)
    if !self.find_by_name(name)
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|instance| instance.name}
  end

  def self.new_from_filename(filename)
    split = filename.split(" - ")
    song_artist = split[0]
    song_name = split[1].chomp('.mp3')
    new_song = self.new(song_name, song_artist)
    new_song
  end

  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    @@all << new_song
    new_song
  end

  def self.destroy_all
    @@all.clear
  end
end
