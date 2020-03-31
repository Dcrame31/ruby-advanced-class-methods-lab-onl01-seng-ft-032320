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
  
  def self.new_by_name(song_name)
    #return song instance with song name set as name property
    song = self.new
    song.name = song_name
    song.save
    song
  end
  
  def self.find_by_name(song_name)
    #finds song name and returns matching instance of the song with that name 
    self.all.detect {|song| song.name == song_name}
  end
  
  def self.find_or_create_by_name(song_name)
    self.all.include?(song_name)
    if false
      self.find_by_name(song_name)
    else
      self.new_by_name(song_name)
    end
  end

  def self.destroy_all
    @@all.clear
  end
end
