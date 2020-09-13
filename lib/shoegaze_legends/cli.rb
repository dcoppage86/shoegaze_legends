class ShoegazeLegends::CLI
    def call
        # starts program and welcomes user
        puts ""
        puts "****************************************************************************"
        puts "* Welcome to Shoegaze Legends, The Top 10 Best Shoegaze albums of all time *"
        puts "****************************************************************************"
        puts ""
        # get_album_list
        # get_user_input
        #give_info_on_album
        start
    end

    def start
        puts "**********************************************************************************************"
        puts "Now lets stop shoegazing and get to the point of our journey here. Are you ready? Enter Y or N"
        puts "**********************************************************************************************"
        input = gets.strip

        puts "**********************************************************************************************"
        puts "Select an number between 1-10."
        puts "**********************************************************************************************"
        input = gets.strip

        if input == "y"
            start
        elsif input == "n"
            puts ""
            puts "See you later...back to reality!"
            exit
        else
            puts ""
            puts "Where are you trying to go with this?"
            start
        end
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