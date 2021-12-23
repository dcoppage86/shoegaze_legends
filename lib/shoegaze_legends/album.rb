module ShoegazeLegends
  class Album
    attr_accessor :name, :artist, :url, :album_info

    @@all = []

    def initialize(name, artist, album_info="")
      @name = name
      @artist = artist
      @album_info = album_info
      @url = url
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
end
