module PryBot
  # A client is used to retrieve information from the client program.
  Client = Struct.new :input, :output, :thread, :stdout, :stderr do
    # Waits until both an input and output are set
    def wait
      sleep 0.01 until input and output and thread
    end

    # Tells the client the session is terminated
    def kill
      thread.run
    end

    # @return [InputProxy] Proxy for the input
    def input_proxy
      InputProxy.new input
    end
  end
end