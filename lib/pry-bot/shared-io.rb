module PryBot
  class SharedIO
    attr_accessor :input_proxy, :output_proxy

    def initialize
      @input = StringIO.new
      @output = StringIO.new

      @input_proxy = PryBot::StringIOProxy.new(@input)
      @output_proxy = PryBot::StringIOProxy.new(@output)
    end

    def readlines
      @output_proxy.readlines
    end

    def peval(string, &cb)
      @input_proxy << string
      cb.call
      return true
    end
  end
end