# class ShoegazeLegends::Artist
#     attr_accessor :name, :album

#     @@all = []

#     def initialize(name)
#         @name = name
#         save
#     end

#     def self.all
#         ShoegazeLegends::Scraper.scrape_artists if @@all.empty?
#         @@all
#     end

#     def save
#         @@all << self
#     end

#     def self.create(artist)
#         artist = self.new(artist)
#         artist.save
#         artist
#     end

#     def add_album(album)
#         album.artist = self if album.artist ==nil
#         self.albums << album if self.albums.include?(album) == false
#     end

#     def albums 
# end