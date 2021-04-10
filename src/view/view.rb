require 'colorize'
require 'tty-prompt'
require_relative "../method/adminsay.rb"
require_relative "../method/animeview.rb"

include Adminsay
include Runanime
print "\e[2J\e[f"
quit = false
until quit
    prompt = TTY::Prompt.new(active_color: :blue)
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
    Runanime.anime
    gets
    print "\e[2J\e[f"
    stop = true
    end

    when 2
    print "\e[2J\e[f"
    load './swap4u.rb'
    quit = true

    when 3
    quit = true
    end
end

print "\e[2J\e[f"
Adminsay.goodbye