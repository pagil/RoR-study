#!/usr/bin/env ruby
require_relative 'RobotSimulator'

# main function
if ARGV.size > 0
  # Read commands from file specified as command line parameter
  robotSimulator = RobotSimulator.new(ARGV[0])
else
  robotSimulator = RobotSimulator.new
end
robotSimulator.mainAppLoop