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


    # LaunchREPL contains methods to initialize the REPL,
  # options parsing, basic command interpretter, and interactive runtime.
  # At this eary stageof the development, I'm unsure if this is both 
  # a user feature, or a kind of exploratory playground to experiemnt the
  # the languages design and interactions with SQLite and Elixir.

  # On the REPL loop function
  # NOTE: Build the idea of a command into a flexible
  # class using macros. For instance, the variables defined
  # as is below will be it's own command or entity type.
  # 

  # TODO: every command or block is a functional map
  # make this a structure