
class ShoegazeLegends::Scraper
    

    # def self.scrape_artists
    #     doc = Nokogiri::HTML(open("https://blog.discogs.com/en/10-of-the-best-shoegaze-records"))
        
    #     artists = doc.css("div.post-entry-content ol li")
        
    #     artists.each do |artist|
    #         name = artist.css("h4 a").text
    #         ShoegazeLegends::Artist.new(name)
    #     end
    #     

    # end

    def self.scrape_albums
        doc = Nokogiri::HTML(open("https://blog.discogs.com/en/10-of-the-best-shoegaze-records"))

        albums = doc.css("div.post-entry-content ol li")

        # hash = {}

        # albums.each do |album|
        #     hash[:name] = album.css("h3 a").text
        #     hash[:artist] = album.css("h4 a").text
        #     hash[:info] = album.css("div.album-description").text.gsub("\n", " ")
        #     ShoegazeLegends::Album.new(hash[:name], hash[:artist], hash[:info])

        albums.each do |album|
            name = album.css("h3 a").text
            artist = album.css("h4 a").text
            info = album.css("div.album-description").text.gsub("\n", " ")
            ShoegazeLegends::Album.new(name, artist,info)   
        end
    end

    # def self.scrape_info
    #     doc = Nokogiri::HTML(open("https://blog.discogs.com/en/10-of-the-best-shoegaze-records"))

    #     album_info = doc.css("div.post-entry-content ol li")

    #     album_info.each do |info|
    #         album_info = info.css("div.album-description").text.gsub("\n", " ")
    #         ShoegazeLegends::Album.new(info)
    #     end
    # end

end