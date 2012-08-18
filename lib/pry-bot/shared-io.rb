module PryBot
  class SharedIO
    attr_accessor :input_proxy, :output_proxy

    def initialize
      @input = StringIO.new
      @output = StringIO.new

      @input_proxy = PryBot::StringIOProxy.new(@input)
      @output_proxy = PryBot::StringIOProxy.new(@output)
    end

    def pry_eval(string)
      @input_proxy << string
      sleep 0.1
      @output_proxy.readlines
    end
  end
end