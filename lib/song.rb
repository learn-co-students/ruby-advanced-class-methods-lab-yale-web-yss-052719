require "pry"

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
    @@all << new_song
    return new_song
  end

  def self.new_by_name(enter_name)
    new_name = self.new
    new_name.name = enter_name
    # @@all << new_name
    new_name
  end

  def self.create_by_name(this_name)
    n_name = self.new
    n_name.name = this_name
    @@all << n_name
    n_name
  end

  def self.find_by_name(string_name)
    self.all.find {|nam| nam.name == string_name}
  end

  def self.find_or_create_by_name(input_name)
    self.find_by_name(input_name) || self.create_by_name(input_name)
  end

  #   if self.all.include?(input_name)
  #       self.find_by_name(input_name)
  #     else
  #       self.create_by_name(input_name)
  #     end
  # end

  def self.alphabetical
    self.all.sort_by do |arr|
      arr.name
    end
  end

  def self.new_from_filename(file_name)
    new_song = self.new
    split_file = file_name.split(" - ")
    new_song.artist_name = split_file[0]
    # new_song.name = new_song[0]
    new_song.name = split_file[1].chomp(".mp3")

    # @@all << new_song

    new_song
  end

  def self.create_from_filename(file_name)
    new_song = self.new
    split_file = file_name.split(" - ")
    new_song.artist_name = split_file[0]
    new_song.name = split_file[1].chomp(".mp3")

    @@all << new_song
  end

  def self.destroy_all
    @@all.clear
  end
end
