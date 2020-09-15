class ShoegazeLegends::Album
    attr_accessor :name, :artist, :url, :album_info

    @@all = []

    def initialize(name)
        @name = name
        @artist = artist
        @url = url
        @album_info = album_info
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