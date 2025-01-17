require 'pry'

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
    song = self.new 
    song.save 
    song 
  end 

  def self.new_by_name(name)
    song = self.new 
    song.name = name 
    #song.save 
    song 
  end 
  
  def self.create_by_name(name)
    song = self.new 
    song.name = name 
    song.save 
    song 
  end 
  
  def self.new_from_filename(filename)
    split_file = filename.split(" - ")
    artist = split_file[0]
    name = split_file[1].split(".")[0]
    song = self.new_by_name(name)
    song.artist_name = artist 
    song
  end 
  
  def self.create_from_filename(filename)
    split_file = filename.split(" - ")
    artist = split_file[0]
    name = split_file[1].split(".")[0]
    song = self.create_by_name(name)
    song.artist_name = artist 
    song
  end 

  def self.find_by_name(name)
    self.all.find do |song|
      song.name == name 
    end 
  end 

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil 
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end 
  end 
  
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end 
  
  def self.destroy_all 
    self.all.clear 
  end 
  
end

Song.create_by_name("The Middle")
Song.find_by_name("The Middle")
