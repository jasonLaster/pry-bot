module PryBot
  # Class used to wrap modules so that they can be sent through DRb. This will
  # mostly be used for Readline.
  class StringIOProxy
    include DRb::DRbUndumped

    attr_accessor :obj
    def initialize(obj)
      @stdout = $stdout
      @stdin = $stdin
      @obj = obj
    end

    def completion_proc=(val)
      if @obj.respond_to? :completion_proc=
        @obj.completion_proc = val
      end
    end

    attr_reader :completion_proc

    def readline(prompt="")
      begin
        @obj.readline()
      rescue EOFError
        ""
      end
    end

    def string()
      @obj.string
    end

    def puts(*lines)
      lines.map! {|line| line.end_with?("\n") ? line : line+"\n" }
      @stdout.puts ": #{lines.inspect}"
      lines.each { |l| self << l}
    end

    def print(*objs)
      @obj.puts(*objs)
    end

    def write(data)
      @obj.write data
    end

    def <<(data)
      @obj.string << data
      self
    end

    def tty?
      false
    end

    def readlines
      pos = @obj.pos
      string = @obj.string[pos..-1]
      @obj.pos = @obj.size
      return string
    end

  end

end
