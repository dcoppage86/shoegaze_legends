class ShoegazeLegends::Album
    attr_accessor :name, :artist, :url, :album_info

    @@all = []

    def initialize(name, artist)
        @name = name
        @artist = artist
        @url = url
        @album_info = album_info
        save
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end



end