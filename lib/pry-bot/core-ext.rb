
module PryBot
  DefaultHost = "localhost"
  DefaultPort = 9876
end


class Object
  # Starts a remote Pry session
  #
  # @param [String]  host Host of the server
  # @param [Integer] port Port of the server
  def remote_pry(host = PryBot::DefaultHost, port = PryBot::DefaultPort)
    PryBot::Server.run(self)
  end

  # a handy alias as many people may think the method is named after the gem
  # (pry-remote)
  alias pry_remote remote_pry
end