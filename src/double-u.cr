require "option_parser"
require "sqlite3"

module Double::U
  VERSION = "0.1.0"

  # LaunchREPL contains methods to initialize the REPL,
  # options parsing, basic command interpretter, and interactive runtime.
  # At this eary stageof the development, I'm unsure if this is both 
  # a user feature, or a kind of exploratory playground to experiemnt the
  # the languages design and interactions with SQLite and Elixir.
  
  class LaunchRepl

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
        # NOTE: Build the idea of a command into a flexible
        # class using macros. For instance, the variables defined
        # as is below will be it's own command or entity type.
        # 

        # TODO: every command or block is a functional map
        # make this a structure
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

  # SQLSetup contains methods that implment an experiment
  # in using SQLite as a kind program runtime engine. In some
  # clever I hope to implement pause, rewind, replay, and other
  # dynamic features in double-u
  # 
  # https://github.com/crystal-lang/crystal-sqlite3
  # 
  # Important:
  # Time is implemented as TEXT column using
  # SQLite3::DATE_FORMAT_SUBSECOND format 
  # (or SQLite3::DATE_FORMAT_SECOND if the text does not
  # contain a dot).
  # Bool is implemented as INT column mapping 0/1 values.
  # 
  # This is maybe a detail that lends itself better for Elixir
  # to interact with the runtime database, where generated data
  # is passed to ELixir then to the databse system.
  # 
  # NOTE - TODO: None of this matters because first I need
  # to use a persistent connection or pools of multiple connections.
  # 2nd a db command entry should align with a command Type/Structure
  class SQLSetup

    def open_command_events_db 
      DB.open "sqlite3://./events.db" do |db|
        db.exec "create table events if not exists (module text, line integer, command text, result text)"
        db
      end

    end

    def close_command_events_db
      DB.close "sqlite3://./events.db"
    end

    def write_command_event(module_name, line_num, command, result)

      db.exec "insert into contacts values (?, ?, ?, >)",
        module_name, line_num, command, result

      puts "Command Events:"
      
      db.query "select name, age from contacts order by age desc" do |rs|
        puts "#{ rs.column_name(0)} #{rs.column_name(1)} #{rs.column_name(2)} #{rs.column_name(3)}"  
      end
    end

  end #!SQLSetp

  repl = LaunchRepl.new
  sql = SQLSetup.new
  # sql.testDB()


  repl.open()
  repl.loop()

end #!module
