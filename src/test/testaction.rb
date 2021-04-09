input = gets.chomp.downcase
if input == "c"
    # Create survey
    Adcontroller.createquiz
elsif input == "r"
    # Read Survey
    Adcontroller.readsurvey
elsif input == "b"
    # Backup Survey File
    print "\e[2J\e[f"
    the_user_wants_to_quit = false
    until the_user_wants_to_quit
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
        the_user_wants_to_quit = true
        print "\e[2J\e[f"
    end
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