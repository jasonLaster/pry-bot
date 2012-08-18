require 'pry-bot'

class Foo
  def initialize
    binding.pry_remote
  end
end


Foo.new