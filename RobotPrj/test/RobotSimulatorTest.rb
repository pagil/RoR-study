#!/usr/bin/env ruby
require 'minitest/autorun'
require_relative '../app/RobotSimulator'

# Unit test for RobotSimulator class
class RobotSimulatorTest  < MiniTest::Unit::TestCase
  def test_initialization_without_file
    robotSimulator = RobotSimulator.new
    assert_nil robotSimulator.robot
    robotSimulator.performCommand "PLACE 2,2,NORTH"
    robotSimulator.performCommand "MOVE"
    robotSimulator.performCommand "MOVE"
    robotSimulator.performCommand "MOVE"
    assert_equal "Output: 2,4,NORTH", robotSimulator.robot.report
    robotSimulator.performCommand "LEFT"
    robotSimulator.performCommand "LEFT"
    robotSimulator.performCommand "MOVE"
    robotSimulator.performCommand "MOVE"
    robotSimulator.performCommand "MOVE"
    robotSimulator.performCommand "MOVE"
    robotSimulator.performCommand "MOVE"
    robotSimulator.performCommand "MOVE"
    assert_equal "Output: 2,0,SOUTH", robotSimulator.robot.report
    robotSimulator.performCommand "LEFT"
    robotSimulator.performCommand "MOVE"
    robotSimulator.performCommand "MOVE"
    robotSimulator.performCommand "MOVE"
    assert_equal "Output: 4,0,EAST", robotSimulator.robot.report
    robotSimulator.performCommand "RIGHT"
    robotSimulator.performCommand "RIGHT"
    robotSimulator.performCommand "MOVE"
    robotSimulator.performCommand "MOVE"
    robotSimulator.performCommand "MOVE"
    robotSimulator.performCommand "MOVE"
    robotSimulator.performCommand "MOVE"
    robotSimulator.performCommand "MOVE"
    assert_equal "Output: 0,0,WEST", robotSimulator.robot.report
  end
  def test_empty_file
    robotSimulator = RobotSimulator.new("../data/empty.txt")
    assert_nil robotSimulator.robot
  end
  def test_empty_file
    robotSimulator = RobotSimulator.new("../data/does_not_exist.txt")
    assert_nil robotSimulator.robot
  end
  def test_ignore
    robotSimulator = RobotSimulator.new
    assert_nil robotSimulator.robot
    robotSimulator.performCommand "MOVE"
    robotSimulator.performCommand "LEFT"
    robotSimulator.performCommand "RIGHT"
    robotSimulator.performCommand "REPORT"
    assert_nil robotSimulator.robot
  end
  def test_input1_txt
    robotSimulator = RobotSimulator.new("../data/input1.txt")
    assert_equal "Output: 0,1,NORTH", robotSimulator.robot.report
  end
  def test_input2_txt
    robotSimulator = RobotSimulator.new("../data/input2.txt")
    assert_equal "Output: 0,0,WEST", robotSimulator.robot.report
  end
  def test_input3_txt
    robotSimulator = RobotSimulator.new("../data/input3.txt")
    assert_equal "Output: 3,3,NORTH", robotSimulator.robot.report
  end
  def test_input_wrong
    robotSimulator = RobotSimulator.new("../data/input_wrong.txt")
    assert_equal "Output: 0,0,NORTH", robotSimulator.robot.report
  end
end
