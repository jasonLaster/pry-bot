require 'pry-bot'

# Simple client app.
# First run pry-bot-demo or another program that starts a pry-bot server
# Then subscribe to shared-io and

shared_io = DRbObject.new nil, 'druby://:9000'

puts shared_io.output_proxy.readlines

input = "2+2"
puts input
result = shared_io.pry_eval input
puts result
