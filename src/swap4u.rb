require 'colorize'
require 'tty-prompt'
require 'csv'

users = []
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
            admin = {}
            puts "======================".cyan
            sleep(0.2)
            print "\e[2J\e[f"
            puts "Hello Admin"
            puts "press enter to continue"
            gets
            admin = {username: "admin", password: "password"}
            while admin != {}
                # admin action
                # create survey
                # delete survey
                # logout
                puts "What would you like to do?"
                puts "Optional : [C]create survey, [D]delete survey, logout"
                # input = "c"
                input = gets.chomp.downcase
                if input == "c"
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
                    #     CSV.open("data/quiz/survey.csv", "a") {|file|
                    #         file.write("#{question},#{answerA},#{answerB},#{answerC}\n")
                    # }
                        CSV.open("data/quiz/survey.csv", "a+") do |csv|
                            csv << hash.values
                            # csv << [question,answerA,answerB,answerC]
                            # hash[:question] = question
                            # hash[:answerA] = answerA
                            # hash[:answerB] = answerB
                            # hash[:answerC] = answerC
                        end
                        p questions
                        puts "Another Question?"
                        input = gets.chomp 
                        if input == "no"
                            the_user_wants_to_quit = true
                        end
                    end
                    # get the name of the survey
                    # create a new survey file with that name
                    # write each of the questions/answers to the csv
                elsif input == "logout"
                        admin = {}
                end
            end
        when 2
            puts "======================".cyan
            sleep(0.2)
            print "\e[2J\e[f"
        end
    when 2
        user = {}
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
            # in the general user menu, when the user logs in
            user = {username: "foo", password: "bar"}

        when 2
            # in the general user menu, when the user signs up
            user = {username: "foo", password: "bar"}
        when 3
            # In the general user menu, when the user exits
            puts "======================".cyan
            sleep(0.2)
            print "\e[2J\e[f"
        end
        if user != {}
            # user can fill out a surver
            # user can view points
            # user can change email address
        end

    when 3
        print "\e[2J\e[f"
        the_user_wants_to_quit = true
    end
end

puts "Goodbye"
# take the new updated users_array
# write to CSV