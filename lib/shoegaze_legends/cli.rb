require 'pry'
class ShoegazeLegends::CLI
    attr_accessor :albums, :artist, :info

    def call
        # starts program and welcomes user
        open_image
        welcomes
        get_albums
        # list_albums
        # get_user_input
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
        album_selector_message
        ShoegazeLegends::Album.all.each.with_index(1) do |album, index| 
            puts "#{index}. #{album.artist} - #{album.name}".cyan
            puts "---------------------------------------"
        end
        get_user_input
    end

    def list_info(album)
        # album = ShoegazeLegends::Album.all
 
        puts "----------------------------------------------------------------------------------------------------".cyan
        puts "#{album.album_info}                                                                                 ".cyan
        puts "----------------------------------------------------------------------------------------------------".cyan
        
        # ShoegazeLegends::Album.all.each do |album, info|
        #     puts "--------------------------------------------------"
        #     puts "#{album.info}"
        #     puts "--------------------------------------------------"
            
        # end
        next_choice
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
        num_of_a = ShoegazeLegends::Album.all.count
        if user_selection.between?(1, num_of_a)
            album = ShoegazeLegends::Album.all[user_selection - 1]
            album
            great_choice
            puts "                        #{album.artist} - #{album.name}            ".red.on_black
            get_album_info(album)
        else
            wrong_choice
            list_albums
        # else
        #     puts "see-ya space-case"
            
        end
    end

    def get_album_info(album)
        more_info
        get_albums
        input = gets.strip

        if input == "y"
            puts ""
            puts ""
            list_info(album)
            puts ""
            puts ""
            puts ""
            # get_user_input
            # get_album_info
        elsif input == "n"
            next_choice
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
            welcomes
        end
    end

    def album_selector_message
        puts ""
        puts "****************************************************************************".black.on_light_magenta
        puts "*                       Select a number between 1-10.                      *".black.on_light_magenta
        puts "****************************************************************************".black.on_light_magenta
        puts " "
        puts " "
    end
        
        

    def nevermind
        puts "****************************************************************************".black.on_light_magenta.blink
        puts "*          Then why are you wasting my time?? Try Again? y or n            *".black.on_light_magenta.blink
        puts "****************************************************************************".black.on_light_magenta.blink
        input = gets.strip
        if input == "y"
            puts ""
            puts ""
            welcomes
        elsif input == "n"
            booted
        else
            wrong_choice
            nevermind
        end
    end

    def next_choice
        puts ""
        puts "****************************************************************************".black.on_light_magenta.blink
        puts "*            Grazing and Gazing Space-Case: Try Again? y or n              *".black.on_light_magenta.blink
        puts "****************************************************************************".black.on_light_magenta.blink
        puts ""
        input = gets.strip
        if input == "y"
            puts ""
            puts ""
            list_albums
        elsif input == "n"
            go_to_playlist
        else
            wrong_choice
        end
    end

    def go_to_playlist
        listen
        input = gets.strip
        if input == "y"
            system("open", "https://open.spotify.com/playlist/6watizY5nc7EEwZLr5uGR9?si=Ot0I_Tc7Q0e0za2KEBz2Hw")
            start_over
        else input == "n"
            goodbye
        end
    end
    
    def start_over
        puts "****************************************************************************".black.on_light_magenta
        puts "*                        Start from the TOP?? y or n                       *".black.on_light_magenta
        puts "****************************************************************************".black.on_light_magenta
        input = gets.strip
        if input == "y"
            list_albums
        elsif input == "n"
            goodbye
        else
            wrong_choice
            list_albums
        end
    end

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

    def listen
        puts "****************************************************************************".black.on_light_magenta
        puts "*        Would you like to listen to a collection of hits?? y or n         *".black.on_light_magenta
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

    def are_you_sure?
        puts " "
        puts "****************************************************************************".black.on_light_magenta
        puts "*                     Are you over it already? y or n                      *".black.on_light_magenta
        puts "****************************************************************************".black.on_light_magenta
        puts " "
        input = gets.strip
        if input == "y"
            goodbye
        else
            list_albums
        end
    end
    
    def goodbye
        puts "
              ██╗      █████╗ ████████╗███████╗██████╗     
              ██║     ██╔══██╗╚══██╔══╝██╔════╝██╔══██╗    
              ██║     ███████║   ██║   █████╗  ██████╔╝    
              ██║     ██╔══██║   ██║   ██╔══╝  ██╔══██╗    
              ███████╗██║  ██║   ██║   ███████╗██║  ██║    
              ╚══════╝╚═╝  ╚═╝   ╚═╝   ╚══════╝╚═╝  ╚═╝    
                                                           
              ███████╗██████╗  █████╗  ██████╗███████╗     
              ██╔════╝██╔══██╗██╔══██╗██╔════╝██╔════╝     
              ███████╗██████╔╝███████║██║     █████╗       
              ╚════██║██╔═══╝ ██╔══██║██║     ██╔══╝       
              ███████║██║     ██║  ██║╚██████╗███████╗     
              ╚══════╝╚═╝     ╚═╝  ╚═╝ ╚═════╝╚══════╝     
                                                           
               ██████╗ █████╗ ███████╗███████╗             
              ██╔════╝██╔══██╗██╔════╝██╔════╝             
              ██║     ███████║███████╗█████╗               
              ██║     ██╔══██║╚════██║██╔══╝               
              ╚██████╗██║  ██║███████║███████╗             
               ╚═════╝╚═╝  ╚═╝╚══════╝╚══════╝             
                                                     ".cyan     
                                             
        exit
    end
            

end