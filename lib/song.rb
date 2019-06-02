class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    new_song = self.new
    self.all << new_song
    new_song    
  end

  def self.new_by_name(name)
    new_song = Song.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.create
    new_song.name = name
    new_song
  end

  def self.find_by_name(name)
    return_song = self.all.find do |song|
      song.name == name
    end
    if return_song.nil?
      return nil
    else
      return_song
    end
  end

  def self.find_or_create_by_name(name)
    existing_song = self.find_by_name(name)
    if existing_song.nil?
      existing_song = self.create_by_name(name)
    end
  existing_song
  end

  def self.alphabetical
    self.all.sort_by do |song|
    song.name
    end
  end

  def self.new_from_filename(filename)
    array = filename.split(" - ")
    artist = array[0]
    name = array[1]
    name = name[0..-5]
    new_file = self.new
    new_file.name = name
    new_file.artist_name = artist
    new_file
  end

  def self.create_from_filename(filename)
    new_song = self.new_from_filename(filename)
    self.all << new_song
  end

  def self.destroy_all
    self.all.clear
  end
end
