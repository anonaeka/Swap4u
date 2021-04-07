require 'colorize'
require 'tty-prompt'
require 'csv'


users_array = []
user = {}
quit = false


require_relative "../controller/admincon.rb"
require_relative "method.rb"

module AdminControl
    def self.admincontrol
        puts "Hello Admin"
    end
end