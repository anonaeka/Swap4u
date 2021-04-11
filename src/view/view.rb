require 'colorize'
require 'tty-prompt'
require_relative "../method/adminsay.rb"
require_relative "../method/animeview.rb"
require_relative "../method/animeclass.rb"

include Adminsay
include Runanime
system 'clear'
print "\e[2J\e[f"
quit = false
until quit
    prompt = TTY::Prompt.new(active_color: :blue)
    Adminsay.introductionview
    choices = [
        {name:'Introduction', value: 1},
        {name:'Start to Swap4U App', value: 2},
        {name:'Exit', value: 3},
    ]

    user_input = prompt.select("Select an action?", choices)

    case user_input
    when 1
    stop = false
    until stop
    print "\e[2J\e[f"
    Runanime.textanime
    loop do
        Adminsay.yesinput
        break if gets.chomp.downcase == 'y'
        print "\e[2J\e[f"
    end
    print "\e[2J\e[f"
    stop = true
    end

    when 2
    print "\e[2J\e[f"
    sleep(0.2)
    load './swap4u.rb'
    quit = true

    when 3
    quit = true
    end
end

print "\e[2J\e[f"
Adminsay.goodbye