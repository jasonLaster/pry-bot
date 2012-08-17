#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "pry-bot"

  s.version = "0.1"

  s.summary     = "Talk to Pry programatically"
  s.description = "Connect to Pry remotely using DRb"
  s.homepage    = "http://github.com/JasonLaster/pry-bot"

  s.email   = "jason.laster.11@gmail.com"
  s.authors = ["Jason Laster"]

  s.files |= Dir["lib/**/*.rb"]
  s.files |= Dir["*.md"]
  s.files << "LICENSE"

  s.require_paths = ["lib"]

  s.add_dependency "pry",  "~> 0.9"

  s.executables = ["pry-bot"]
end
