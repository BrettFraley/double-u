require "sqlite3"

class WDB
    @conn : DB::Database
    @type : Symbol
    @path : String
    
    def initialize(type, path)
        @conn = connect()
        @type = type
        @path = path
    end

    def connect
        DB.open "sqlite3://./runtime.db"
    end

    def connection
        @conn
    end

end
