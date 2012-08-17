# What is it?

A way to talk to Pry from another application. This is achieved by using DRb to proxy Pry's input and output. 

# Usage

  shared_io = DRbObject.new nil, 'druby://:9000'
  result = shared_io.pry_eval input

# Thanks

This project is heavily influenced by Mon Ouie's Pry Remote. 

