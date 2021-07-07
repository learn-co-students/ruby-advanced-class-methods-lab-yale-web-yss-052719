require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize(name=nil, code=0)
  	@name = name
  	if code == 0
  		self.save
  	end
  	@@all << self
  	self
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
  	self.new
  end

  def self.new_by_name(name)
  	self.new(name, 1)
  end

  def self.create_by_name(name)
  	self.new(name)
  end
  
  def self.find_by_name(name)
  	self.all.find do |song|
  		if song.name == name
  			song
  		else
  			false
  		end
  	end
  end

  def self.find_or_create_by_name(name)
  	if self.find_by_name(name)
  		self.find_by_name(name)
  	else
  		self.create_by_name(name)
  	end
  end

  def self.alphabetical
  	alphasongs = self.all.map do |song|
  		song.name
  	end.sort.uniq!

  	alphasongs.map do |song|
  		find_by_name(song)
  	end
  end



  def self.new_from_filename(file)
  	info = file.split(" - ")
  	info[1].slice!(".mp3")
  	created = self.new_by_name(info[1])
  	created.artist_name = info[0]
  	created
  end

  def self.create_from_filename(file)
  	info = file.split(" - ")
  	info[1].slice!(".mp3")
  	created = self.create_by_name(info[1])
  	created.artist_name = info[0]
  	created
  end

  def self.destroy_all
  	self.all.clear
  end
end
