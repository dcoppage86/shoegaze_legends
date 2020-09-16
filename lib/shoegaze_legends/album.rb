class ShoegazeLegends::Album
    attr_accessor :name, :artist, :url, :album_info

    @@all = []

    def initialize(name)
        @name = name
        save
    end

    def self.all
        @@all
    end

    def save
        @@all << self
    end



end