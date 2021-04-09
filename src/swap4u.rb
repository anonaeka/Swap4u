require 'colorize'
require 'tty-prompt'
require 'csv'

require_relative "method/adminsay.rb"

include Adminsay
user = {}
the_user_wants_to_quit = false
until the_user_wants_to_quit
Adminsay.thenametitle
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
            # Part of Admin
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
                Adminsay.adminsay
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
                elsif input == "r"
                    # Read Survey
                    the_user_wants_to_quit = false
                    until the_user_wants_to_quit
                        CSV.open("data/quiz/survey.csv","r") do |csv|
                            csv.each do |questions|
                                puts "Question #{questions}"
                            end
                        end
                        puts "Press enter to go back menu."
                        gets
                        the_user_wants_to_quit = true
                        print "\e[2J\e[f"
                        sleep(0.2)
                    end
                elsif input == "b"
                    # Backup Survey File
                    the_user_wants_to_quit = false
                    until the_user_wants_to_quit
                        File.rename("data/quiz/survey.csv", "data/quiz/backup2.csv")
                        CSV.open("data/quiz/survey.csv", "a")
                        print "\e[2J\e[f"
                        sleep(0.2)
                        puts "Complete."
                        puts "Press enter to go back menu."
                        gets
                        the_user_wants_to_quit = true
                    end
                elsif input == "d"
                    # Delete Survey File
                    the_user_wants_to_quit = false
                    until the_user_wants_to_quit
                        puts "Enter survey.csv to delete"
                        puts "Press enter to go back menu."
                        gets
                        the_user_wants_to_quit = true
                    end
                elsif input == "l"
                    admin_login = false
                    sleep(0.2)
                    print "\e[2J\e[f"
                else
                    print "\e[2J\e[f"
                    sleep(0.2)
                    puts "Please type the first letters of function do you need.".red
                    sleep(2)
                    print "\e[2J\e[f"
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
                        user[:username] = usernname
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
                puts "Optional : [S]urvey, [V]iew Point, [L]ogout" 
                input = gets.chomp.downcase
                if input == "s"
                    
                #DoSurvey
                    listquestions = []
                    puts "======================".cyan
                    sleep(0.2)
                    print "\e[2J\e[f"
                    CSV.open("data/quiz/survey.csv", "r") do |csv|
                        csv.each do |line|
                            hash = {question: line[0], answerA: line[1], answerB: line[2], answerC: line[3]}
                            listquestions.push(hash)
                        end
                    end
                    listanswers = [user[:username]]
                    listquestions.each do |hash|
                        p "---------------------"
                        puts " #{hash[:question]}"
                        puts " #{hash[:answerA]}"
                        puts " #{hash[:answerB]}"
                        puts " #{hash[:answerC]}"
                        p "---------------------"
                        puts "Enter your answer"
                        input = gets.chomp
                        listanswers.push(input)
                    end
                    p listanswers
                    CSV.open("data/answer/userans.csv", "a+") do |csv|
                        csv << listanswers
                    end

                elsif input == "v"
                    user_login = false
                elsif input == "l"
                    user_login = false
                else
                    print "\e[2J\e[f"
                    sleep(0.2)
                    puts "Please type the first letters of function do you need.".red
                    sleep(2)
                    print "\e[2J\e[f"
                end
            end
        when 2
            #UserSignup
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
                puts "======= Congratulations =======".green
                puts "You have successfully registered.".green
                puts "= Press enter to go back menu =".cyan
                gets
            end
        when 3
            # In the general user menu, when the user exits
            puts "======================".cyan
            sleep(0.2)
            print "\e[2J\e[f"
        end
    when 3
        print "\e[2J\e[f"
        the_user_wants_to_quit = true
    end
end
print "\e[2J\e[f"
Adminsay.goodbye