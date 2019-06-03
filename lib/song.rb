class Song
  @@all = []
  attr_accessor :name
  
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


end
