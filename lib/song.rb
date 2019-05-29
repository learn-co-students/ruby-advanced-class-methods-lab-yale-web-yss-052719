class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def Song.create
    song = Song.new
    song.save
    return song
  end

    def Song.new_by_name(name)
      song = Song.new
      song.name = name
      song
    end
    
    def Song.create_by_name(name)
      song = Song.new
      song.name = name
      song.save
      song
    end

    def Song.find_by_name(name)
      Song.all.detect do |song|
        song.name == name
      end
    end
    
    def Song.find_or_create_by_name(name)
      Song.find_by_name(name) || Song.create_by_name(name)
    end

    def Song.alphabetical
      Song.all.sort_by do |song|
        song.name
      end
    end

    def Song.new_from_filename(fname)
      artist = fname.split(" - ")[0]
      sname = fname.split(" - ")[1].chomp(".mp3")
      song = Song.new
      song.name = sname
      song.artist_name = artist
      song
    end
    def Song.create_from_filename(fname)
      song = Song.new_from_filename(fname)
      song.save
      song

    end

    def Song.destroy_all
      @@all = []
    end
end
