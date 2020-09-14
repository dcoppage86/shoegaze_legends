class ShoegazeLegends::CLI
    def call
        # starts program and welcomes user
        puts ""
        puts "****************************************************************************"
        puts "* Welcome to Shoegaze Legends, The Top 10 Best Shoegaze albums of all time *"
        puts "****************************************************************************"
        puts ""
        get_albums
        list_albums
        # get_user_album
        get_user_input
        # start
    end

    def get_albums
        #scrape
        @albums = ["My Bloody Valentine - Loveless", "Ride - Nowhere", "Slowdive - Souvlaki", "Jesus and Mary Chain - Psychocandy", "Cocteau Twins - Heaven Or Las Vegas", "Verve - A Storm In Heaven", "Swervedriver - Mezcal Head", "Catherine Wheel - Chrome", "Lush - Spooky", "Chapterhouse - Whirlpool"]
        # binding.pry
    end

    def list_albums
        puts "**********************************"
        puts "* Select a number between 1-10. *"
        puts "**********************************"
        @albums.each.with_index(1) do |album, index| 
            puts "#{index}. #{album}"
        end
    end

    # def get_user_album
    #     user_selection = gets.strip.to_i
    #     method(user_selection) if valid?(user_selection, @albums)
    # end
    # refactored into the get_user_input method

    def valid?(input, data)
        input.to_i <= data.length && input.to_i > 0
    end

    def get_user_input
        user_selection = gets.strip.to_i
        if user_selection.between?(1, 10)
            album = @albums[user_selection - 1]
            album.get_albums
            puts "#{album}"
        end
        get_albums
    end
            

end