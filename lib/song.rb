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
    a = Song.new
    @@all << a
    a
  end

  def self.new_by_name(string)
    a = Song.new
    a.name= string
    a
  end

  def self.create_by_name(string)
    a = Song.new
    a.name= string
    @@all << a
    a
  end

  def self.find_by_name(string)
    @@all.find do |song|
      song.name == string
    end
  end

  def self.find_or_create_by_name(string)
    if self.find_by_name(string)
      self.find_by_name(string)
    else
      self.create_by_name(string)
    end
  end

  def self.alphabetical
    @@all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    array = filename.split(/-/)
    a = Song.new
    a.artist_name= array[0].strip
    a.name= array[1].strip.chomp(".mp3")
    a
    # a.name= array[1]
  end

  def self.create_from_filename(filename)
    a = self.new_from_filename(filename)
    @@all << a
    a
  end

  def self.destroy_all
    @@all.clear
  end

end
