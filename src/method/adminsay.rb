module Adminsay 

  def adminsay
    puts "=================== Hello Admin ====================".cyan
    puts "============ What would you like to do? ============".green
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

  def incorrectinfo
    print "\e[2J\e[f"
    sleep(0.2)
    puts "Incorrect Information.".red
    puts "Press enter to go back menu.".green
  end

  def errorfuctions
    print "\e[2J\e[f"
    sleep(0.2)
    puts "Please type the first letters of function do you need.".red
    sleep(1.5)
    print "\e[2J\e[f"
  end

  def hellouser
    puts "=================== Hello User =====================".cyan
    puts "============ What would you like to do? ============".green
  end

  def usersignupdone
    puts "==================== Congratulations ================".green
    puts "========= You have successfully registered ==========".green
    puts "=========== Press enter to go back menu =============".cyan
    gets
    print "\e[2J\e[f"
  end

  def thxforanswer
    print "\e[2J\e[f"
    puts "================= Thank you for answers =============".green
    puts "=========== Press enter to go back menu =============".cyan
    gets
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