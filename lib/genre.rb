class Genre
    attr_accessor :name, :songs

    extend Concerns::Findable
    
    @@all = []

    def initialize(name)
      @name = name
      @songs = []
    end

    def self.all
      @@all
    end

    def save
      @@all << self
    end

    def self.destroy_all
      @@all.clear
    end

    def self.create(name)
      genre = Genre.new(name)
      genre.save
      genre
    end

    def artists
      arr = songs.collect {|song|
      song.artist}
      arr.uniq
    end

end
