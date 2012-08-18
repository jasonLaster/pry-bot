require 'pry-bot'

class Foo
  def initialize
    binding.pry_bot
  end
end


Foo.new