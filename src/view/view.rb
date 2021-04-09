require 'colorize'
require 'tty-prompt'
include Adminsay

module View
    def self.title  
      prompt = TTY::Prompt.new(active_color: :red)
      choices = [
          {name:'Introduction', value: 1},
          {name:'Skip', value: 2},
      ]
      user_input = prompt.select("Select an action?", choices)
      case user_input
        when 1
        sleep(0.2)
        print "\e[2J\e[f"
        end
        when 2
        sleep(0.2)
        print "\e[2J\e[f"
        end
    end
end