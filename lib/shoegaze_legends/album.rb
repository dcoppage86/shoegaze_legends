class ShoegazeLegends::Album
    attr_accessor :name, :artist, :url, :album_info

    @@all = []

    def initialize(name)
        @name = name
        @artist = artist
        @url = url
        @album_info = album_info
    end

    def self.all
        @@all
    end

    def self.save
        @@all << self
    end

end