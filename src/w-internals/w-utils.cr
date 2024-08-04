module W::Utils

  class Debug

    def info(caller_line = __LINE__, end_of_caller = __END_LINE__)
        puts "Called from line number: #{caller_line}"
        puts "Currently at line number: #{__LINE__}"
        puts "End of caller block is at: #{end_of_caller}"
        puts "File path is: #{__FILE__}"
        puts "Directory file is in: #{__DIR__}"
    end
  
  end

end
