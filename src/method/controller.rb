module Adcontroller

    def createquiz
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
    end

    def readsurvey
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
    end

    def deletecsv
    print "\e[2J\e[f"
    sleep(0.2)
    print "Enter ".yellow
    print "survey.csv".red
    print " to delete".yellow
    puts ""
    delete_file_name = gets.chomp.downcase
    if File.exist?(delete_file_name)
        File.delete(delete_file_name)
        print "File".yellow
        print " #{delete_file_name}".green
        print " has deleted".yellow
        puts ""
        else
        print "\e[2J\e[f"
        sleep(0.2)
        print "File".red
        print " #{delete_file_name}".yellow
        print " does not exist".red
        puts ""
        end
    end

end