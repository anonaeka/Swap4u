require 'colorize'
require 'tty-prompt'
require 'csv'
require 'fileutils'

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
        {name:'Back to Introduction', value: 3},
        {name:'Exit', value: 4},
    ]
    user_input = prompt.select("Select an action?", choices)
    case user_input
    when 1
        sleep(0.3)
        print "\e[2J\e[f"
        Adminsay.thenametitleshort
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
            Adminsay.thenametitleshort
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
                Adminsay.incorrectinfoadmin
            end
            while admin_login == true
                print "\e[2J\e[f"
                Adminsay.thenametitleshort
                Adminsay.adminsay
            choices = [
            {name:'Create Survey', value: 1},
            {name:'Read Survey', value: 2},
            {name:'Back Up Files', value: 3},
            {name:'Delete Files', value: 4},
            {name:'Logout', value: 5},
            ]
        user_input = prompt.select("Select an action?", choices)
        case user_input
                when 1
                    # Create survey
                    Adcontroller.createquiz
                when 2
                    # Read Survey
                    Adcontroller.readsurvey
                when 3
                    # Backup Survey File
                    print "\e[2J\e[f"
                    Adminsay.thenametitleshort
                        choices = [
                            {name:'Backup Quiz', value: 1},
                            {name:'Backup Answer', value: 2},
                            {name:'Back', value: 3},
                        ]
                        user_input = prompt.select("Select an action?", choices)
                        case user_input
                        when 1
                            Adcontroller.backupfile
                        when 2
                            Adcontroller.backupanswerfile
                        when 3
                        print "\e[2J\e[f"
                end
                when 4
                    # Delete Survey File
                        Adcontroller.deletecsv
                when 5
                    admin_login = false
                    sleep(0.2)
                    print "\e[2J\e[f"
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
        Adminsay.thenametitleshort
        choices = [
            {name:'Login', value: 1},
            {name:'Signup', value: 2},
            {name:'Go Back', value: 3},
        ]
        user_input = prompt.select("Select an action?", choices)
        case user_input
        when 1
            #UserLogin
            user_login = false
            sleep(0.2)
            print "\e[2J\e[f"
            Adminsay.thenametitleshort
            true_user = false
            puts "What is your Username?".cyan
            username = gets.chomp
            puts "What is your Password?".cyan
            password = gets.chomp
            CSV.open("data/users.csv", "r") do |csv|
                csv.each do |line|
                    if line[0] == username
                        if line[1] == password
                        true_user = true
                        user_login = true
                        user[:username] = username
                        print "\e[2J\e[f"
                        end
                    end
                end
            end
            if user_login == false
                Adminsay.incorrectinfouser
            end
            #UserAction
            while user_login == true
            sleep(0.3)
            print "\e[2J\e[f"
            Adminsay.thenametitleshort
            user_online = username
            puts "User: ".yellow + user_online + " Online".green
            Adminsay.hellouser
            choices = [
                {name:'Do Survey', value: 1},
                {name:'Logout', value: 2},
            ]
            user_input = prompt.select("Select an action?", choices)
            case user_input
            when 1
                #DoSurvey
                sleep(0.2)
                print "\e[2J\e[f"
                listquestions = []
                CSV.open("data/quiz/survey.csv", "r") do |csv|
                        csv.each do |line|
                        hash = {question: line[0], answerA: line[1], answerB: line[2], answerC: line[3]}
                        listquestions.push(hash)
                        end
                    end
                    listanswers = [user[:username]]
                    listquestions.each do |hash|
                        Adminsay.thenametitleshort
                        p "---------------------"
                        puts " #{hash[:question]}".yellow
                        puts " #{hash[:answerA]}".cyan
                        puts " #{hash[:answerB]}".cyan
                        puts " #{hash[:answerC]}".cyan
                        p "---------------------"
                        puts "Enter your answer".green
                        input = gets.chomp.downcase
                        listanswers.push(input)
                        print "\e[2J\e[f"
                    end
                    p listanswers
                    CSV.open("data/answer/userans.csv", "a+") do |csv|
                        csv << listanswers
                end
                Adminsay.thxforanswer
                when 2
                user_login = false
                print "\e[2J\e[f"
                end
            end
        when 2
            # UserSignup
            Adcontroller.usersignup
        when 3
            # Go Back
            sleep(0.2)
            print "\e[2J\e[f"
        end
    when 3
        the_user_wants_to_quit = true
        print "\e[2J\e[f"
        system 'clear'
        sleep(0.2)
        load "view/view.rb"
    when 4
        print "\e[2J\e[f"
        the_user_wants_to_quit = true
    end
end
        print "\e[2J\e[f"
        system 'clear'
        Adminsay.goodbye
