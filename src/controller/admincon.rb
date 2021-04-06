require 'colorize'
require 'tty-prompt'

require_relative "login.rb"
require_relative "../model/admindev.rb"


module Loginmode

    def self.loginmode
        prompt = TTY::Prompt.new(active_color: :red)
        choices = [
            {name:'Admin Login', value: 1},
            {name:'Go Back', value: 2},
        ]

        user_input = prompt.select("Select an action?", choices)

        case user_input
        when 1
        puts "======================".cyan
        sleep(0.2)
        View.clear
        AdminControl.admincontrol
        

        when 2
        puts "======================".cyan
        sleep(0.2)
        View.clear
        LoginMenu.loginmenu
        
        end
    end
end