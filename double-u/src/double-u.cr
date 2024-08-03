require "option_parser"

module Double::U
  VERSION = "0.1.0"

  # REPL start, options parsing, basic commands
  class LaunchRepl
    
    def open
      
        option_parser = OptionParser.parse do |parser|
          parser.banner = "* * * * D O U B L E - U * * * *"
        

            parser.on "-v", "--version", "Show version" do
                puts "version"
                exit
            end

            parser.on "-h", "--help", "Show help" do
                puts parser
                exit
            end

            parser.missing_option do |option_flag|
                STDERR.puts "ERROR: #{option_flag} is missing something."
                STDERR.puts ""
                STDERR.puts parser
                exit(1)
            end

            parser.invalid_option do |option_flag|
                STDERR.puts "ERROR: #{option_flag} is not a valid option."
                STDERR.puts parser
                exit(1)
            end
        end
    end

    def loop
        # NOTE: Build the idea of a command into a flexible
        # class using macros. For instance, the variables defined
        # as is below will be it's own command or entity type.
        
        line = 0
        errors = [] of String
        previous_command = ""
        current_command = ""
        previous_return = ""
        current_return = ""

        until false
            puts "\ndouble-u: "

            line += 1
            error = false

            previous_command = line == 0 ? "" : current_command
            current_command = gets
            
            puts "Received current command: #{ current_command }"
            puts "Previous command was: #{ previous_command }"
        end
    end



  end # !LaunchREPL

repl = LaunchRepl.new
  repl.open()
  repl.loop()
  
end   # !module

