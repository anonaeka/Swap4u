require 'colorize'
require 'tty-prompt'
require 'csv'

require_relative "method/adminsay.rb"
require_relative "method/controller.rb"

include Adminsay
include Adcontroller

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
            sleep(0.2)
            print "\e[2J\e[f"
            # Admin action
            true_admin = false
            puts "What is your Adminname?".cyan
            adminname = gets.chomp
            puts "What is your Adminpassword?".cyan
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
                Adminsay.incorrectinfo
                gets
            end
            while admin_login == true
                Adminsay.adminsay
                input = gets.chomp.downcase
                if input == "c"
                    # Create survey
                    Adcontroller.createquiz
                elsif input == "r"
                    # Read Survey
                    Adcontroller.readsurvey
                elsif input == "b"
                    # Backup Survey File
                    the_user_wants_to_quit = false
                    until the_user_wants_to_quit
                        Adcontroller.backupfile
                        puts "Press enter to go back menu.".green
                        gets
                        the_user_wants_to_quit = true
                        print "\e[2J\e[f"
                    end
                elsif input == "d"
                    # Delete Survey File
                    the_user_wants_to_quit = false
                    until the_user_wants_to_quit
                        Adcontroller.deletecsv
                        puts "Press enter to go back menu.".green
                        gets
                        the_user_wants_to_quit = true
                        print "\e[2J\e[f"
                    end
                elsif input == "l"
                    admin_login = false
                    sleep(0.2)
                    print "\e[2J\e[f"
                else
                    Adminsay.errorfuctions
                end
            end
        when 2
            # Exit
            sleep(0.2)
            print "\e[2J\e[f"
        end
    when 2
        # Part of Users
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
                Adminsay.incorrectinfo
                gets
            end
            #UserAction
            while user_login == true
                Adminsay.hellouser
                input = gets.chomp.downcase
                if input == "s"
                #DoSurvey
                    listquestions = []
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
                        input = gets.chomp.downcase
                        listanswers.push(input)
                        print "\e[2J\e[f"
                    end
                    p listanswers
                    CSV.open("data/answer/userans.csv", "a+") do |csv|
                        csv << listanswers
                    end
                    print "\e[2J\e[f"
                elsif input == "l"
                    user_login = false
                else
                    Adminsay.errorfuctions
                end
            end
        when 2
            #UserSignup
            usersignup = []
            signuser = {}
            sleep(0.2)
            print "\e[2J\e[f"
            puts "What is your username?".cyan
            signuser[:username] = gets.chomp
            puts "What is your password?".cyan
            signuser[:password] = gets.chomp
            usersignup.push(signuser)
            CSV.open("data/users.csv", "a+") do |csv|
                csv << signuser.values
                Adminsay.usersignupdone
            end
        when 3
            # Exit
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