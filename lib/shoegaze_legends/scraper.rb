class ShoegazeLegends::Scraper

    def scrape_album
        doc = Nokogiri::HTML(open("https://blog.discogs.com/en/10-of-the-best-shoegaze-records"/))    
    end


    def scrape_album_info

    end

end