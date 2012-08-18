
module PryBot
  DefaultHost = "localhost"
  DefaultPort = 9876
end


class Object
  # Starts a remote Pry session
  #
  # @param [String]  host Host of the server
  # @param [Integer] port Port of the server
  def pry_bot(host = PryBot::DefaultHost, port = PryBot::DefaultPort)
    PryBot::Server.run(self)
  end

end