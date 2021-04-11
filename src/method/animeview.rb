module Runanime
    def textanime
        system 'clear'
        puts "
░█──░█ █▀▀ █── █▀▀ █▀▀█ █▀▄▀█ █▀▀ 
░█░█░█ █▀▀ █── █── █──█ █─▀─█ █▀▀ 
░█▄▀▄█ ▀▀▀ ▀▀▀ ▀▀▀ ▀▀▀▀ ▀───▀ ▀▀▀
        ".green
        sleep(0.4)
        print "\e[2J\e[f"
        puts "
▀█▀ █▀█
░█░ █▄█
        ".yellow
        sleep(0.4)
        print "\e[2J\e[f"
        puts "
█ █▄░█ ▀█▀ █▀█ █▀█ █▀▄ █░█ █▀▀ █▀▀
█ █░▀█ ░█░ █▀▄ █▄█ █▄▀ █▄█ █▄▄ ██▄             
        ".cyan
        sleep(0.4)
        print "\e[2J\e[f"
        puts "
█▀ █░█░█ ▄▀█ █▀█ █░█ █░█
▄█ ▀▄▀▄▀ █▀█ █▀▀ ▀▀█ █▄█     
        ".red
        sleep(0.4)
        print "\e[2J\e[f"
        puts "
▄▀█ █▀█ █▀█
█▀█ █▀▀ █▀▀  
        ".yellow
        sleep(0.4)
        print "\e[2J\e[f"
    end
end