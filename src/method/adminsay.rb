module Adminsay 

  def introductionview
    puts""
    puts"
                      ██╗███╗   ██╗████████╗██████╗  ██████╗ ██████╗ ██╗   ██╗ ██████╗████████╗██╗ ██████╗ ███╗   ██╗
                      ██║████╗  ██║╚══██╔══╝██╔══██╗██╔═══██╗██╔══██╗██║   ██║██╔════╝╚══██╔══╝██║██╔═══██╗████╗  ██║
                      ██║██╔██╗ ██║   ██║   ██████╔╝██║   ██║██║  ██║██║   ██║██║        ██║   ██║██║   ██║██╔██╗ ██║
                      ██║██║╚██╗██║   ██║   ██╔══██╗██║   ██║██║  ██║██║   ██║██║        ██║   ██║██║   ██║██║╚██╗██║
                      ██║██║ ╚████║   ██║   ██║  ██║╚██████╔╝██████╔╝╚██████╔╝╚██████╗   ██║   ██║╚██████╔╝██║ ╚████║
                      ╚═╝╚═╝  ╚═══╝   ╚═╝   ╚═╝  ╚═╝ ╚═════╝ ╚═════╝  ╚═════╝  ╚═════╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝".cyan
    puts"                                                                               
                                              ████████╗     ██╗     █████╗     ██████╗                                    
                                              ╚══ ██╔══╝    ███║    ██╔══██╗    ╚════██╗                                   
                                                  ██║       ╚██║    ███████║     █████╔╝                                   
                                                  ██║        ██║    ██╔══██║     ╚═══██╗                                   
                                                  ██║        ██║    ██║  ██║    ██████╔╝                                   
                                                  ╚═╝        ╚═╝    ╚═╝  ╚═╝    ╚═════╝".green
    puts"                                                       Swap4U Terminal Application".red
    puts"                                                                   by".yellow
    puts"                                                            Anon Jaloenklung".green
  end

  def yesinput
    print "
    =▀▀█▀▀ █──█ █▀▀█ █▀▀ 
    =──█── █▄▄█ █──█ █▀▀ 
    =──▀── ▄▄▄█ █▀▀▀ ▀▀▀
"
    print "
          ░█──░█ 
          ░█▄▄▄█ 
          ──░█──
".yellow
    print "
█▀▀▀ █▀▀█ 　 █▀▀▄ █▀▀█ █▀▀ █─█ 
█─▀█ █──█ 　 █▀▀▄ █▄▄█ █── █▀▄ 
▀▀▀▀ ▀▀▀▀ 　 ▀▀▀─ ▀──▀ ▀▀▀ ▀─▀
"
  puts ""
  print "Type "
  print "Y".yellow
  print " or "
  print "y".yellow
  print " to Go Back"
  puts ""
  end

  def adminsay
    print "Hello ".cyan
    print "Admin".red
    print " User".cyan
    puts ""
    puts "What would you like to do?".green
  end

  def thenametitle
    puts""
    puts""
    puts""   
    puts"                                              ===================== Welcome =====================".green
    puts"                                              ======================   To   =====================".green
    puts""
    puts"                                              ███████╗██╗    ██╗ █████╗ ██████╗ ██╗  ██╗██╗   ██╗".red
    puts"                                              ██╔════╝██║    ██║██╔══██╗██╔══██╗██║  ██║██║   ██║"
    puts"                                              ███████╗██║ █╗ ██║███████║██████╔╝███████║██║   ██║"
    puts"                                              ╚════██║██║███╗██║██╔══██║██╔═══╝ ╚════██║██║   ██║"
    puts"                                              ███████║╚███╔███╔╝██║  ██║██║          ██║╚██████╔╝".red
    puts"                                              ╚══════╝ ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝          ╚═╝ ╚═════╝" .blue
    puts"                                                                        By".yellow
    puts"                                                                 Anon Jaloenklung".red
    puts"                                              ===================================================".green
    puts"                                              ===================================================".green
    puts""
    puts"" 
  end

    def thenametitleshort
      puts""
      puts""   
      puts"                                              ===================================================".green
      puts""
      puts"                                              ███████╗██╗    ██╗ █████╗ ██████╗ ██╗  ██╗██╗   ██╗".red
      puts"                                              ██╔════╝██║    ██║██╔══██╗██╔══██╗██║  ██║██║   ██║"
      puts"                                              ███████╗██║ █╗ ██║███████║██████╔╝███████║██║   ██║"
      puts"                                              ╚════██║██║███╗██║██╔══██║██╔═══╝ ╚════██║██║   ██║"
      puts"                                              ███████║╚███╔███╔╝██║  ██║██║          ██║╚██████╔╝".red
      puts"                                              ╚══════╝ ╚══╝╚══╝ ╚═╝  ╚═╝╚═╝          ╚═╝ ╚═════╝" .blue
      puts"                                              ===================================================".green
      puts""
      puts""
  end

  def incorrectinfo
    print "\e[2J\e[f"
    Adminsay.thenametitleshort
    puts "Incorrect Information.".red
    puts "Press enter to go back menu.".green
    gets
    print "\e[2J\e[f"
  end

  def hellouser
    puts "Hello User".cyan
    puts "What would you like to do?".green
  end

  def usersignupdone
    print "\e[2J\e[f"
    Adminsay.thenametitleshort
    puts "Congratulations.".green
    puts "You have successfully registered.".green
    puts "Press enter to go back menu.".cyan
    gets
    print "\e[2J\e[f"
  end

  def thxforanswer
    print "\e[2J\e[f"
    Adminsay.thenametitleshort
    puts "Thank you for answers.".green
    puts "Press enter to go back menu.".cyan
    gets
    print "\e[2J\e[f"
  end

  def goodbye
    puts " 
                                        ██████╗  ██████╗  ██████╗ ██████╗ ██████╗ ██╗   ██╗███████╗
                                        ██╔════╝ ██╔═══██╗██╔═══██╗██╔══██╗██╔══██╗╚██╗ ██╔╝██╔════╝
                                        ██║  ███╗██║   ██║██║   ██║██║  ██║██████╔╝ ╚████╔╝ █████╗  
                                        ██║   ██║██║   ██║██║   ██║██║  ██║██╔══██╗  ╚██╔╝  ██╔══╝  
                                        ╚██████╔╝╚██████╔╝╚██████╔╝██████╔╝██████╔╝   ██║   ███████╗
                                        ╚═════╝  ╚═════╝  ╚═════╝ ╚═════╝ ╚═════╝    ╚═╝   ╚══════╝".cyan
  end

end