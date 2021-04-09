module Adminsay 
  def adminsay
    puts "=================== Hello Admin ====================".cyan
    puts "============ What would you like to do? ============".green
    puts "====================  Optional  ====================".green
    puts "===[C]reate Survey  [R]ead Survey  [B]ack Up File===".green
    puts "===============   [D]elete Survey   ================".red
    puts "====================  [L]ogout  ====================".yellow
  end

  def thenametitle
    puts ""
    puts ""
    puts ""   
    puts "                                                                  ============ Welcome ============ ".cyan
    puts "                                                                  ============    To   ============ ".cyan
    puts "                                                                   ___  _ _ _  ___  ___   __   _ _  ".red
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

  def errorfuctions
    print "\e[2J\e[f"
    sleep(0.2)
    puts "Please type the first letters of function do you need.".red
    sleep(2)
    print "\e[2J\e[f"
  end

  def goodbye
    puts " 
######    #######   #######  ########  ########  ##    ## ######## 
##    ##  ##     ## ##     ## ##     ## ##     ##  ##  ##  ##       
##        ##     ## ##     ## ##     ## ##     ##   ####   ##       
##   #### ##     ## ##     ## ##     ## ########     ##    ######   
##    ##  ##     ## ##     ## ##     ## ##     ##    ##    ##       
##    ##  ##     ## ##     ## ##     ## ##     ##    ##    ##       
######    #######   #######  ########  ########     ##    ######## ".red
  end

  def introview
    puts "Hello World"
  end
end