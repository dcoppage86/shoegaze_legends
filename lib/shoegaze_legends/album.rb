class ShoegazeLegends::Album
    attr_accessor :name, :artist

    @@all = []

    def initialize(name)
        @name = name
        @artist = artist
    end

    def self.all
        @@all
    end

    def self.save
        @@all << self
    end

end