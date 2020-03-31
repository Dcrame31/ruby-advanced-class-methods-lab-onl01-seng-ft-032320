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
  
  def self.find_or_create_by_name(find_this_song)
    # This method will accept a string name for a song and 
    # either return a matching song instance with that name 
    # or create a new song with the name and return the song instance.
    did_i_find_it = self.all.detect {|x| x.name == find_this_song}
    if did_i_find_it == nil
      s = self.new 
      s.name = find_this_song
      s.save 
      s
    else
      did_i_find_it
    end
  end

  def self.destroy_all
    @@all.clear
  end
end
