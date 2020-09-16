require 'pry'
class ShoegazeLegends::CLI
    def call
        # starts program and welcomes user
        puts ""
        puts "****************************************************************************"
        puts "* Welcome to Shoegaze Legends, The Top 10 Best Shoegaze albums of all time *"
        puts "*                Ready For Lift-Off? Select y or n                         *"
        puts "****************************************************************************"
        puts ""
        get_albums
        list_albums
        get_user_input
        get_album_info
        binding.pry
        # start
    end

    def get_albums
        @albums = ShoegazeLegends::Album.all
    end

    def list_albums
        puts "**********************************"
        puts "* Select a number between 1-10. *"
        puts "**********************************"
        puts " "
        puts " "
        @albums.each.with_index(1) do |album, index, artist| 
            puts "#{index}. #{artist.name} - #{album.name}"
            puts "---------------------------------------"
        end
    end

    # def get_user_album
    #     user_selection = gets.strip.to_i
    #     method(user_selection) if valid?(user_selection, @albums)
    # end
    # refactored into the get_user_input method

    # def valid?(input, data)
    #     input.to_i <= data.length && input.to_i > 0
    # end
    # unneeded now...

    def get_user_input
        user_selection = gets.strip.to_i
        if user_selection.between?(1, 10)
            album = @albums[user_selection - 1]
            album
            puts " "
            puts "**********************************************************"
            puts "*               Great Choice, Space-Case!                *"
            puts "**********************************************************"
            puts " "
            puts "----------------------------------------------------------"
            puts "               #{album}"
            puts "----------------------------------------------------------"
        end
    end

    def get_album_info
        puts " "
        puts "**********************************************************"
        puts "* Would you like more info on this album? select y or n! *"
        puts "**********************************************************"
        puts " "

        input = gets.strip
        while input != "exit"
            if input == "y"
                puts "album info"
                list_albums
                get_user_input
                get_album_info
            elsif input == "n"
                puts " "
                puts "***********************************************************"
                puts "*   Then chose another album or type exit SPACE-CASE!!!   *"
                puts "***********************************************************"
                puts " "
                list_albums
                get_user_input
                get_album_info
            else
                puts "***********************************************************"
                puts "*      What are you trying to achieve here Einstein??     *"
                puts "***********************************************************"
                list_albums
                get_user_input
                get_album_info
            end
        end
    end

    def goodbye
        "See ya next time, Space-Case!"
    end
            

end