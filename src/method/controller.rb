module Adcontroller

    def createquiz
        questions = []
        the_user_wants_to_quit = false
        until the_user_wants_to_quit
            hash = {}
            puts "What a question?".green
            hash[:question] = gets.chomp
            puts "What an answer A".cyan
            hash[:answerA] = gets.chomp
            puts "What an answer B".cyan
            hash[:answerB] = gets.chomp
            puts "What an answer C".cyan
            hash[:answerC] = gets.chomp
            questions.push(hash)
            CSV.open("data/quiz/survey.csv", "a+") do |csv|
                csv << hash.values
            end
            p questions
            puts "Another Question?".green
            puts "Enter if want to continue".yellow
            puts "[N] if want to go back".red
            input = gets.chomp.downcase
            if input == "n"
                the_user_wants_to_quit = true
            end
        end
    end

    def readsurvey
        print "\e[2J\e[f"
        the_user_wants_to_quit = false
        until the_user_wants_to_quit
            CSV.open("data/quiz/survey.csv","r") do |csv|
                csv.each do |questions|
                    puts "Question #{questions}"
                end
            end
            puts "Press enter to go back menu.".green
            gets
            the_user_wants_to_quit = true
            print "\e[2J\e[f"
            sleep(0.2)
        end
    end

    def backupfile
        print "Type ".yellow
        print "Name".red
        print " to Backup Survey File".yellow
        puts ""
        renamebackup = gets.chomp.downcase
        File.rename("data/quiz/survey.csv", "data/quizbackup/" + renamebackup + ".csv")
        CSV.open("data/quiz/survey.csv", "a")
        print "\e[2J\e[f"
        sleep(0.7)
        puts "Backup Completed".yellow
        puts "Press enter to go back menu.".green
        gets
        print "\e[2J\e[f"
    end

    def backupanswerfile
        print "Type ".yellow
        print "Name".red
        print " to Backup Answer File".yellow
        puts ""
        answerbackup = gets.chomp.downcase
        File.rename("data/answer/userans.csv", "data/ansbackup/" + answerbackup + ".csv")
        CSV.open("data/answer/userans.csv", "a")
        print "\e[2J\e[f"
        sleep(0.7)
        puts "Backup Completed".yellow
        puts "Press enter to go back menu.".green
        gets
        print "\e[2J\e[f"
    end

    def deletecsv
    print "\e[2J\e[f"
    sleep(0.2)
    print "Enter ".yellow
    print "survey.csv".red
    print " to delete".yellow
    puts ""
    delete_file_name = gets.chomp.downcase
    if File.exist?("data/quiz/" + delete_file_name)
        File.delete("data/quiz/" + delete_file_name)
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

    def usersignup
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
    end

end