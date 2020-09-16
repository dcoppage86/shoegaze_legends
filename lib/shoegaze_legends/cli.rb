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
        # binding.pry
        # start
    end

    def get_albums
        @albums = ShoegazeLegends::Album.all
    end

    def get_artists
        @artists = ShoegazeLegends::Album.all
    end

    def list_albums
        puts "**********************************"
        puts "* Select a number between 1-10. *"
        puts "**********************************"
        puts " "
        puts " "
        @albums.each.with_index(1) do |album, index, artist| 
            puts "#{index}. #{album.artist.name} - #{album.name}"
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
            puts "               #{album.artist.name} - #{album.name}"
            puts "----------------------------------------------------------"
        elsif user_selection != user_selection.between?(1, 10)
            puts "***********************************************************"
            puts "*      What are you trying to achieve here Einstein??     *"
            puts "***********************************************************"
            list_albums
        else
            "see-ya space-case"
            exit
        end
    end

    def get_album_info
        puts " "
        puts "**********************************************************"
        puts "* Would you like more info on this album? select y or n! *"
        puts "**********************************************************"
        puts " "
        input = gets.strip
        if input == "y"
            puts " "
            puts "**********************************************************"
            puts "*               album info to be scraped                 *"
            puts "**********************************************************"
            puts " "
            list_albums
            get_user_input
            get_album_info
        elsif input == "n"
            puts " "
            puts "**********************************************************"
            puts "*    Choose another album then or exit, Space-case!     *"
            puts "**********************************************************"
            puts " "
            list_albums
            get_user_input
        elsif input == "list"
            list_albums
        else
            exit
        end
    end
    
    def goodbye
        "See ya next time, Space-Case!"
    end
            

end