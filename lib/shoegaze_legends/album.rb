class ShoegazeLegends::Album
    attr_accessor :name, :artist, :url, :album_info

    @@all = []

    def initialize(name, artist, album_info)
        @name = name
        @artist = artist
        # @info = info
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

    # def add_album_info
    #     ShoegazeLegends::Scraper.scrape_info if @album_info.empty?
    # end

 



end