class ShoegazeLegends::Scraper
    

    def self.scrape_albums
        doc = Nokogiri::HTML(open("https://blog.discogs.com/en/10-of-the-best-shoegaze-records"))
        
        artists = doc.css("div.post-entry-content ol li")[0].css("h4 a").text
       
        end

        
    end


    def scrape_album_info

    end

end