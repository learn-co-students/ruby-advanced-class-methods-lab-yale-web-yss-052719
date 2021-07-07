require "pry"



class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize
    @name = name
    @artist_name = artist_name
    @@all << self
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    @@all << song
    song
  end
  
  def self.find_by_name(name)
    self.all.find do |song|
      song.name == name
    end
  end

  def self.names
    self.all.map {|song| song.name}
  end

  def self.find_or_create_by_name(name)
    # if self.names.include?(name) == true
    #   self.find_by_name(name)
    # else
    #   self.create_by_name(name)
    # end
    self.find_by_name(name) || self.create_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    name = filename.chomp(".mp3").split(" - ")
    song = self.new
    song.name = name[1]
    song.artist_name = name[0]
    song
  end

  def self.create_from_filename(filename)
    name = filename.chomp(".mp3").split(" - ")
    song = self.new
    song.name = name[1]
    song.artist_name = name[0]
    @@all << song
    song
  end

  def self.destroy_all
    @@all = []
  end
      
end
