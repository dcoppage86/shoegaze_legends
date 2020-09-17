class ShoegazeLegends::Album
    attr_accessor :name, :artist, :url, :info

    @@all = []

    def initialize(name, artist, info)
        @name = name
        @artist = artist
        @info = info
        save
    end

    def self.all
        ShoegazeLegends::Scraper.scrape_albums if @@all.empty?
        @@all
    end

    def save
        @@all << self
    end



end