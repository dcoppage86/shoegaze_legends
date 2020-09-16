class ShoegazeLegends::Scraper
    

    def self.scrape_artists
        doc = Nokogiri::HTML(open("https://blog.discogs.com/en/10-of-the-best-shoegaze-records"))
        
        artists = doc.css("div.post-entry-content ol li")
        
        artists.each do |artist|
            name = artist.css("h4 a").text
            ShoegazeLegends::Artist.new(name)
        end
    end

    def self.scrape_album
        doc = Nokogiri::HTML(open("https://blog.discogs.com/en/10-of-the-best-shoegaze-records"))

        albums = doc.css("div.post-entry-content ol li")

        albums.each do |album|
            name = album.css("h4 a").text
            ShoegazeLegends::Album.new(name)
            
        end
    end

    # def self.scrape_info
    #     doc = 

    #     album_info = 


    # end

end