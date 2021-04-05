require 'colorize'


module View
    def self.title  
        puts ""
        puts ""
        puts ""   
        puts "                                                                  ============ Welcome ============ ".cyan
        puts "                                                                  ============    To   ============ ".cyan
        puts "                                                                   ___  _ _ _  ___  ___   __   _ _ ".red
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
      end

#  //// Clear ////
        def self.clear
        print "\e[2J\e[f"
        end
end