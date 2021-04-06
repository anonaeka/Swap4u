require 'colorize'
require 'tty-prompt'
require 'csv'

require_relative 'admincon.rb'
require_relative "../model/loginuser.rb"
require_relative "../model/signupid.rb"



module LoginMenu
    def self.loginmenu
        prompt = TTY::Prompt.new(active_color: :red)
        choices = [
            {name:'Admin', value: 1},
            {name:'Login', value: 2},
            {name:'Signup', value: 3},
            {name:'Exit', value: 4},
        ]

        user_input = prompt.select("Select an action?", choices)

        case user_input
        when 1
        puts "======================".cyan
        sleep(0.3)
        View.clear
        Loginmode.loginmode
        when 2
        puts "======================".cyan
        sleep(0.3)
        View.clear
        LoginControl.logincontrol
        when 3
        puts "======================".cyan
        sleep(0.3)
        View.clear
        SignControl.signcontrol
        when 4
        View.clear
        end
    end
end