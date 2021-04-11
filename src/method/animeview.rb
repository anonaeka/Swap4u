module Runanime
    def textanime
        system 'clear'
        puts "
░█──░█ █▀▀ █── █▀▀ █▀▀█ █▀▄▀█ █▀▀ 
░█░█░█ █▀▀ █── █── █──█ █─▀─█ █▀▀ 
░█▄▀▄█ ▀▀▀ ▀▀▀ ▀▀▀ ▀▀▀▀ ▀───▀ ▀▀▀
        ".green
        sleep(0.4)
        puts "
▀█▀ █▀█
░█░ █▄█
        ".yellow
        sleep(0.4)
        puts "
█ █▄░█ ▀█▀ █▀█ █▀█ █▀▄ █░█ █▀▀ █▀▀
█ █░▀█ ░█░ █▀▄ █▄█ █▄▀ █▄█ █▄▄ ██▄             
        ".cyan
        sleep(0.4)
        puts "
█▀ █░█░█ ▄▀█ █▀█ █░█ █░█
▄█ ▀▄▀▄▀ █▀█ █▀▀ ▀▀█ █▄█     
        ".red
        sleep(0.4)
        puts "
▄▀█ █▀█ █▀█
█▀█ █▀▀ █▀▀  
        ".yellow
        sleep(0.4)
        print "\e[2J\e[f"
    end

    def introex
        puts "
█░█ █▀▀ █░░ █░░ █▀█   █
█▀█ ██▄ █▄▄ █▄▄ █▄█   ▄
        ".green
        sleep(0.4)
        puts "
   ^___^       
 y( • ~•)y
    ====
        ".blue
        puts "I am Swap4U cat.".blue
        puts ""
        sleep(0.4)
        puts "This section introduces the basic operations and techniques needed to use the Swap4U app.".yellow
        sleep(0.4)
        puts "There is one main feature that administrators can do is create a questionnaire, which the app itself already has instructions on when it comes to using that feature.".yellow
        sleep(0.4)
        puts ""
        print "But in the part of ".yellow
        print "deleting files,".red
        print " it is recommended that you ".yellow
        print "back up ".green
        print "the data first so that you can reuse it later.".yellow
        puts ""
        sleep(0.4)
        puts "How to login to the admin system The application has already assigned the user admin.".yellow
        sleep(0.4)
        puts ""
        print "This is the "
        print "Admin ID !!".red
        sleep(0.4)
        puts ""
        print "Admin user: "
        sleep(0.6)
        print "adminuser".green
        puts ""
        sleep(0.4)
        print "Password: "
        sleep(0.6)
        print "adminpass".green
        sleep(0.4)
        puts ""
        puts "Please remember Admin ID to login to the Admin action feature.".yellow
        puts ""
        print "If ready to use Swap4U app, please press ".red
        print "Enter".green
        puts ""
        gets
        print "\e[2J\e[f"
    end

end