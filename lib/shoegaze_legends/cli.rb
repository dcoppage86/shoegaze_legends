class ShoegazeLegends::CLI
    def call
        # starts program and welcomes user
        # puts "*******************************************************"
        puts "* Welcome User...to Shoegaze Legends...Are you ready? *"
        # puts "*******************************************************"
        get_album_list
        get_user_input
        #give_info_on_album
    end

    def get_album_list
        #scrape
        @albums = ["My Bloody Valentine - Loveless", "Ride - Nowhere", "Slowdive - Souvlaki", "Jesus and Mary Chain - Psychocandy", "Cocteau Twins - Heaven Or Las Vegas", "Verve - A Storm In Heaven", "Swervedriver - Mezcal Head", "Catherine Wheel - Chrome", "Lush - Spooky", "Chapterhouse - Whirlpool"]
    end

    def get_user_input
        @albums.each.with_index(1) do |album, index| 
            puts "#{index}. #{album}"
        end
    end

end