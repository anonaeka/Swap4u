require 'colorize'
require 'tty-prompt'
require 'csv'

# users = []
the_user_wants_to_quit = false
until the_user_wants_to_quit
    puts ""
    puts ""
    puts ""   
    puts "                                                                  ============ Welcome ============ ".cyan
    puts "                                                                  ============    To   ============ ".cyan
    puts "                                                                   ___  _ _ _  ___  ___   __   _ _  ".red
    puts "                                                                  / __>| | | || . || . \ /. | | | | ".blue
    puts "                                                                  \__ \| | | ||   ||  _//_  .|| ' | ".green
    puts "                                                                  <___/|__/_/ |_|_||_|    |_| `___' ".yellow
    puts ""
    puts "                                                                                  By"
    puts "                                                                           Anon Jaloenklung"
    puts "                                                                  ================================= ".cyan
    puts "                                                                  ================================= ".cyan
    puts ""
    puts "" 
    prompt = TTY::Prompt.new(active_color: :red)
    choices = [
        {name:'Admin', value: 1},
        {name:'General User', value: 2},
        {name:'Exit', value: 3},
    ]

    user_input = prompt.select("Select an action?", choices)

    case user_input
    when 1
        puts "======================".cyan
        sleep(0.3)
        print "\e[2J\e[f"
        prompt = TTY::Prompt.new(active_color: :red)
        choices = [
            {name:'Admin Login', value: 1},
            {name:'Go Back', value: 2},
        ]

        user_input = prompt.select("Select an action?", choices)

        case user_input
        when 1
            admin_login = false
            puts "======================".cyan
            sleep(0.2)
            print "\e[2J\e[f"
            # Admin action
            true_admin = false
            puts "What is your Adminname?"
            adminname = gets.chomp
            puts "What is your Adminpassword?"
            adminpass = gets.chomp
            CSV.open("data/adminusers.csv", "r") do |csv|
                csv.each do |line|
                    if line[0] == adminname
                        if line[1] == adminpass
                        true_admin = true
                        admin_login = true
                        print "\e[2J\e[f"
                        end
                    end
                end
            end
            if admin_login == false
                puts "Incorrect Information."
                puts "Press enter to go back menu."
                gets
            end
            while admin_login == true
                puts "Hello Admin"
                # create survey
                # delete survey
                # logout
                puts "What would you like to do?"
                puts "Optional : [C]reate Survey, [D]elete Survey, [L]ogout"
                input = gets.chomp.downcase
                if input == "c"
                    # Create survey
                    questions = []
                    the_user_wants_to_quit = false
                    until the_user_wants_to_quit
                        hash = {}
                        puts "What a question?"
                        hash[:question] = gets.chomp
                        puts "What an answer A"
                        hash[:answerA] = gets.chomp
                        puts "What an answer B"
                        hash[:answerB] = gets.chomp
                        puts "What an answer C"
                        hash[:answerC] = gets.chomp
                        questions.push(hash)
                        CSV.open("data/quiz/survey.csv", "a+") do |csv|
                            csv << hash.values
                        end
                        p questions
                        puts "Another Question?"
                        puts "Enter if want to continue, [N] if want to go back"
                        input = gets.chomp.downcase
                        if input == "n"
                            the_user_wants_to_quit = true
                        end
                    end
                elsif input == "d"
                    #Delete Survey
                    the_user_wants_to_quit = false
                    until the_user_wants_to_quit
                        puts "Enter if want to continue, [N] if want to go back"
                        input = gets.chomp.downcase
                        if input == "n"
                            the_user_wants_to_quit = true
                        end
                end
                elsif input == "l"
                    admin_login = false
                end
            end
        when 2
            puts "======================".cyan
            sleep(0.2)
            print "\e[2J\e[f"
        end
    when 2
        # Part of Users
        puts "======================".cyan
        sleep(0.3)
        print "\e[2J\e[f"
        choices = [
            {name:'Login', value: 1},
            {name:'Signup', value: 2},
            {name:'Exit', value: 3},
        ]
        user_input = prompt.select("Select an action?", choices)
        case user_input
        when 1
            #UserLogin
            user_login = false
            puts "======================".cyan
            sleep(0.2)
            print "\e[2J\e[f"
            true_user = false
            puts "What is your Username?"
            usernname = gets.chomp
            puts "What is your Password?"
            password = gets.chomp
            CSV.open("data/users.csv", "r") do |csv|
                csv.each do |line|
                    if line[0] == usernname
                        if line[1] == password
                        true_user = true
                        user_login = true
                        print "\e[2J\e[f"
                        end
                    end
                end
            end
            if user_login == false
                puts "Incorrect Information."
                puts "Press enter to go back menu."
                gets
            end
            #UserAction
            while user_login == true
                puts "Hello User"
                puts "What would you like to do?"
                puts "Optional : [S]urvey, [D]elete Answer, [L]ogout" 
                input = gets.chomp.downcase
                if input == "s"
                #DoSurvey
                    answersurvey = []
                elsif input == "d"
                    user_login = false
                elsif input == "l"
                    user_login = false
                end
            end
        when 2
            #UserSignup
            # user_signup = false
            usersignup = []
            signuser = {}
            puts "======================".cyan
            sleep(0.2)
            print "\e[2J\e[f"
            puts "What is your username?"
            signuser[:username] = gets.chomp
            puts "What is your password?"
            signuser[:password] = gets.chomp
            puts "What is your email?"
            signuser[:emailuser] = gets.chomp
            usersignup.push(signuser)
            CSV.open("data/users.csv", "a+") do |csv|
                csv << signuser.values
                puts "== Congratulations =="
                puts "You have successfully registered."
                puts "Enter to comeback menu"
                gets
            end
        when 3
            # In the general user menu, when the user exits
            puts "======================".cyan
            sleep(0.2)
            print "\e[2J\e[f"
        end
        # if user != {}
            # user can fill out a surver
            # user can view points
            # user can change email address
        # end

    when 3
        print "\e[2J\e[f"
        the_user_wants_to_quit = true
    end
end

print "\e[2J\e[f"
puts " 
                                                ######    #######   #######  ########  ########  ##    ## ######## 
                                                ##    ##  ##     ## ##     ## ##     ## ##     ##  ##  ##  ##       
                                                ##        ##     ## ##     ## ##     ## ##     ##   ####   ##       
                                                ##   #### ##     ## ##     ## ##     ## ########     ##    ######   
                                                ##    ##  ##     ## ##     ## ##     ## ##     ##    ##    ##       
                                                ##    ##  ##     ## ##     ## ##     ## ##     ##    ##    ##       
                                                 ######    #######   #######  ########  ########     ##    ######## ".red
puts ""
# take the new updated users_array
# write to CSV