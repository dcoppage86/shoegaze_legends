module ShoegazeLegends
  class Scraper

    def self.scrape_albums
      doc = Nokogiri::HTML(URI.open("https://blog.discogs.com/en/10-of-the-best-shoegaze-records"))
      artist_info = doc.css("div.blog_entity_review div")

      artist_info.each do |artist|
        artist_name = artist.css("h4 a").text
        album_name = artist.css("h3 a").text
        ShoegazeLegends::Album.new(album_name, artist_name)
      end
    end

  end
end
