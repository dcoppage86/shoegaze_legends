require 'pry'
class ShoegazeLegends::CLI
    attr_accessor :albums, :artist, :info

    def call
        # starts program and welcomes user
        open_image
        welcomes
        get_albums
        # list_albums
        get_user_input
        # get_album_info
        # binding.pry
        # start
    end

    def open_image
        puts "
        ███████╗██╗  ██╗ ██████╗ ███████╗ ██████╗  █████╗ ███████╗███████╗
        ██╔════╝██║  ██║██╔═══██╗██╔════╝██╔════╝ ██╔══██╗╚══███╔╝██╔════╝
        ███████╗███████║██║   ██║█████╗  ██║  ███╗███████║  ███╔╝ █████╗  
        ╚════██║██╔══██║██║   ██║██╔══╝  ██║   ██║██╔══██║ ███╔╝  ██╔══╝  
        ███████║██║  ██║╚██████╔╝███████╗╚██████╔╝██║  ██║███████╗███████╗
        ╚══════╝╚═╝  ╚═╝ ╚═════╝ ╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚══════╝
    ██╗     ███████╗ ██████╗ ███████╗███╗   ██╗██████╗ ███████╗   
    ██║     ██╔════╝██╔════╝ ██╔════╝████╗  ██║██╔══██╗██╔════╝   
    ██║     █████╗  ██║  ███╗█████╗  ██╔██╗ ██║██║  ██║███████╗   
    ██║     ██╔══╝  ██║   ██║██╔══╝  ██║╚██╗██║██║  ██║╚════██║   
    ███████╗███████╗╚██████╔╝███████╗██║ ╚████║██████╔╝███████║   
    ╚══════╝╚══════╝ ╚═════╝ ╚══════╝╚═╝  ╚═══╝╚═════╝ ╚══════╝   
                                                                  
                                                                                           ".cyan                                                                                         
                                                                                                       
                                                                                                       
    end

    def get_albums
        ShoegazeLegends::Scraper.new
        # @albums = ShoegazeLegends::Album.all
    end

    # def get_artists
    #     @artists = ShoegazeLegends::Artist.all
    # end

    def list_albums
        puts ""
        puts "****************************************************************************".black.on_light_magenta
        puts "*                       Select a number between 1-10.                      *".black.on_light_magenta
        puts "****************************************************************************".black.on_light_magenta
        puts " "
        puts " "
        ShoegazeLegends::Album.all.each.with_index(1) do |album, index, artist| 
            puts "#{index}. #{album.artist} - #{album.name}".cyan
            puts "---------------------------------------"
        end
    end

    def list_info
        ShoegazeLegends::Album.all.each do |album, info|
            puts "--------------------------------------------------"
            puts "#{album.info}"
            puts "--------------------------------------------------"
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
            great_choice
            puts "                        #{album.artist} - #{album.name}            ".red.on_black
            get_album_info
        elsif user_selection != user_selection.between?(1, 10)
            wrong_choice
            list_albums
        else
            booted
        # else
        #     puts "see-ya space-case"
            
        end
    end

    def get_album_info
        more_info
        get_albums
        input = gets.strip

        if input == "y"
            puts ""
            puts ""
            list_info
            puts ""
            puts ""
            puts ""
            # get_user_input
            # get_album_info
        elsif input == "n"
          choose_an_album
            # list_albums
            # get_user_input
        elsif input == "list"
            list_albums
        else
            goodbye
        end
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
                nevermind
        else
                wrong_choice
                goodbye
        end
    end
        
        

    def nevermind
        puts "****************************************************************************".black.on_light_magenta.blink
        puts "*          Then why are you wasting my time?? Try Again? y or n            *".black.on_light_magenta.blink
        puts "****************************************************************************".black.on_light_magenta.blink
        input = gets.strip
        if input == "y"
            puts ""
            puts ""
            call
        elsif input == "n"
            booted
        else
            wrong_choice
        end
    end

    def next_choice
        puts ""
        puts "****************************************************************************".black.on_light_magenta.blink
        puts "*            Grazing and Gazing Space-Case: Try Again? y or n              *".black.on_light_magenta.blink
        puts "****************************************************************************".black.on_light_magenta.blink
        puts ""
    
    def great_choice
        puts " "
        puts "****************************************************************************".black.on_light_magenta
        puts "*                                                                          *".black.on_light_magenta
        puts "*                        Great Choice, Space-Case!                         *".black.on_light_magenta
        puts "*                                                                          *".black.on_light_magenta
        puts "****************************************************************************".black.on_light_magenta
        puts ""
    end

    def wrong_choice
        puts "****************************************************************************".black.on_light_magenta
        puts "*              What are you trying to achieve here Einstein??              *".black.on_light_magenta
        puts "****************************************************************************".black.on_light_magenta
    end

    def booted
        puts "****************************************************************************".black.on_light_magenta
        puts "*                   Really?!?, get out of here...GENIUS!!!                 *".black.on_light_magenta
        puts "****************************************************************************".black.on_light_magenta
        exit
    end
    
    def more_info
        puts " "
        puts "****************************************************************************".black.on_light_magenta
        puts "*            Would you like more info on this album? select y or n!        *".black.on_light_magenta
        puts "****************************************************************************".black.on_light_magenta
        puts " "
    end

    def choose_an_album
        puts " "
        puts "****************************************************************************".black.on_light_magenta
        puts "*                Then choose list album or exit, Space-case!               *".black.on_light_magenta
        puts "****************************************************************************".black.on_light_magenta
        puts " "
    end
    
    def goodbye
        puts " "
        puts "****************************************************************************".black.on_light_magenta
        puts "*                        See-ya Later, Space-Case!!                        *".black.on_light_magenta
        puts "****************************************************************************".black.on_light_magenta
        puts " "
        exit
    end
            

end