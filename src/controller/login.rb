require 'colorize'
require 'tty-prompt'

module LoginMenu
    def self.loginmenu
        prompt = TTY::Prompt.new
        choices = [
            {name:'Login', value: 1},
            {name:'Signup', value: 2},
            {name:'Exit', value: 3},
        ]

        user_input = prompt.select("Select an action?", choices)

        case user_input
        when 1
        puts "======================".cyan

        when 2
        puts "======================".cyan
        
        when 3
        View.clear
        end
    end
end