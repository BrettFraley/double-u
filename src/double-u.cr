require "option_parser"

require "./tokens"
require "./w-db/db"

module Double::U
  VERSION = "0.1.0"

  # LaunchREPL contains methods to initialize the REPL,
  # options parsing, basic command interpretter, and interactive runtime.

  class LaunchRepl
    @db : WDB
    @sql : DB::Database

    def initialize()
      @db = WDB.new(:command_event, "test")
      @sql = @db.connection()
    end

    def launch
        option_parser = OptionParser.parse do |parser|
          parser.banner = "* * * * D O U B L E - U * * * *"
        
          parser.on "-v", "--version", "Show version" do
              puts VERSION
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
            
      end #launch

    def loop

        line = 0
        errors = [] of String
        previous_command = ""
        current_command = ""
        previous_return = ""
        current_return = ""

        @sql.exec("drop table if exists events")
        @sql.exec "create table events (module, line, command, result)"

        until false
            puts "\ndouble-u: "

            line += 1
            error = false

            previous_command = line == 0 ? "" : current_command
            current_command = gets
            
            puts "Received current command: #{ current_command }"
            puts "Previous command was: #{ previous_command }"

            @sql.exec("insert into events values (?, ?, ?, ?)",
              "REPL", line, current_command, "test current return")

            puts "Command Events:"
      
            results = @sql.exec("select * from events")
            puts results
        end
    end

  end # !LaunchREPL

  repl = LaunchRepl.new
  repl.launch()
  repl.loop()

end #!module
