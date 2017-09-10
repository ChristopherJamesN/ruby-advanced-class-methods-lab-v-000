class Song
  attr_accessor :name, :artist_name
  @@all = []

  def artist_name=(name)
    @artist_name=name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(name)
    @@all.select {|song| song.name == name} [0]
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
    else
      self.find_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    filename.slice!(".mp3")
    filename = filename.split(" - ")
    self.new_by_name(filename[1])
    song.artist_name = filename[0]
  end

  def self.create_from_filename(filename)
    filename.slice!(".mp3")
    filename = filename.split(" - ")
    self.find_or_create_by_name(filename[1])
    song.artist_name = filename[0]
  end

  def self.destroy_all
    @@all = []
  end

end
