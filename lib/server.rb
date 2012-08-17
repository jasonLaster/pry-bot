require 'pry-bot'
require 'drb'

module PryBot
  class Server
    def self.run(object)
      shared_io = PryBot::SharedIO.new
      DRb.start_service 'druby://:9000', shared_io
      
      # Startup PRY
      Pry.color = false
      Pry.pager = false
      pry = Pry.start(object, :input => shared_io.input_proxy, :output => shared_io.output_proxy)

      # Kill PRY
      DRb.thread.join
      trap("INT") { DRb.stop_service }
    end
  end
end