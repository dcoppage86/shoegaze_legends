require 'pry'
class ShoegazeLegends::CLI
    attr_accessor :albums, :artist

    def call
        # starts program and welcomes user
        welcomes
        get_albums
        # list_albums
        get_user_input
        get_album_info
        # binding.pry
        # start
    end

    def open_image
        puts "===SSS================================================================"
        puts "========00========================================================"
        puts "==S   S====0  0========================================================="
        puts "=== S=====0  0======================================================="
        puts "==== S===0  0========================================================="
        puts "==S   S====00=========================================================="
        puts "===SSS==============================================================="
    end



    def welcomes
        puts ""
        puts "****************************************************************************".black.on_light_magenta.blink
        puts "* Welcome to Shoegaze Legends, The Top 10 Best Shoegaze albums of all time *".black.on_light_magenta.blink
        puts "*                Ready For Lift-Off? Select y or n                         *".black.on_light_magenta.blink
        puts "****************************************************************************".black.on_light_magenta.blink
        puts ""
        input = gets.strip
        if input == "y"
            list_albums
        elsif input == "n"
            puts "****************************************************************************".blue
            puts "*                   Then why are you wasting my time??                     *".blue
            puts "****************************************************************************".blue
            goodbye
        end
    end


    def get_albums
        ShoegazeLegends::Scraper.new
        # @albums = ShoegazeLegends::Album.all
    end

    # def get_artists
    #     @artists = ShoegazeLegends::Artist.all
    # end

    def list_albums
        puts "**********************************"
        puts "* Select a number between 1-10.  *"
        puts "**********************************"
        puts " "
        puts " "
        ShoegazeLegends::Album.all.each.with_index(1) do |album, index, artist| 
            puts "#{index}. #{album.artist} - #{album.name}"
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
            album = ShoegazeLegends::Album.all[user_selection - 1]
            album
            puts " "
            puts "**********************************************************"
            puts "*               Great Choice, Space-Case!                *"
            puts "**********************************************************"
            puts "**********************************************************"
            puts "               #{album.artist} - #{album.name}"
            puts "**********************************************************"
        # else user_selection != user_selection.between?(1, 10)
        else
            puts "***********************************************************"
            puts "*      What are you trying to achieve here Einstein??     *"
            puts "***********************************************************"
            list_albums
        # else
        #     puts "see-ya space-case"
            
        end
    end

    def get_album_info
        more_info
        input = gets.strip
        if input == "y"
            puts " "
            puts "**********************************************************"
            puts "*               album info to be scraped                 *"
            puts "**********************************************************"
            puts " "
            puts "                   "
            get_user_input
            get_album_info
        elsif input == "n"
            puts " "
            puts "**********************************************************"
            puts "*    Then choose list album or exit, Space-case!     *"
            puts "**********************************************************"
            puts " "
            # list_albums
            # get_user_input
        elsif input == "list"
            list_albums
        else
            goodbye
        end
    end

    def album_choice
        
    end

    def more_info
        puts " "
        puts "**********************************************************"
        puts "* Would you like more info on this album? select y or n! *"
        puts "**********************************************************"
        puts " "
    end
    
    def goodbye
        puts "****************************************************************************"
        puts "*                        See-ya Later, Space-Case!!                        *"
        puts "****************************************************************************"
        exit
    end
            

end