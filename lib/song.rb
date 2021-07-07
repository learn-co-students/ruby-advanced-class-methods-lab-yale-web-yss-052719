class Song
  @@all = []
  attr_accessor :name, :artist_name
  
  def self.all
    @@all
  end
  
  def initialize
    @@all << self
  end

  def self.create 
    newSong = Song.new
    @@all <<  newSong
    newSong
  end
  
  def self.new_by_name(name)
    newSong = Song.new
    newSong.name = name
    newSong
  end

  def self.create_by_name(name)
    newSong = Song.new
    newSong.name = name
    @@all << newSong
    newSong
  end
   

  def self.find_by_name(name)
  @@all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) != nil
      self.find_by_name(name)
    else
      self.create_by_name(name)
    end
end

def self.destroy_all
  @@all = []
end

def self.alphabetical
  @@all.sort_by do |song|
    song.name
  end.uniq
end

def self.new_from_filename(filename)
  filename = filename.split('.')[0]
  songName = filename.split("- ")[1]
  newSong = Song.new
  newSong.artist_name = filename.split("- ")[0].split(" ")[0]
  newSong.name = songName
  newSong
end

def self.create_from_filename(filename)
  filename = filename.split('.')[0]
  songName = filename.split("- ")[1]
  newSong = Song.new
  newSong.artist_name = filename.split("- ")[0].split(" ")[0]
  newSong.name = songName
  @@all << newSong


  newSong 
end


end
