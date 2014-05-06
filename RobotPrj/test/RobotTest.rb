#!/usr/bin/env ruby
require 'minitest/autorun'
require_relative '../app/Robot'

# Unit tests for Robot class
class RobotTest < MiniTest::Unit::TestCase
  def test_create_x_validation
    exception = assert_raises(RuntimeError) do Robot.new(-1,0,"NORTH") end
    assert_equal "Illegal argument exception: coordinate", exception.message
  end
  def test_create_y_validation
    exception = assert_raises(RuntimeError) do Robot.new(1,10,"NORTH") end
    assert_equal "Illegal argument exception: coordinate", exception.message
  end
  def test_create_direction_validation
    exception = assert_raises(RuntimeError) do Robot.new(1,1,"SEVER") end
    assert_equal "Illegal argument exception: direction", exception.message
  end
  def test_create_positive
    robot = Robot.new(0,0,"NORTH")
    assert_equal "Output: 0,0,NORTH", robot.report
  end
  def test_move_corner_south_west
    robot = Robot.new(0,0,"SOUTH")
    robot.move
    # Assert move to the SOUTH ignored
    assert_equal "Output: 0,0,SOUTH", robot.report
    robot.right
    robot.move
    # Assert robot turned and ignored move to the WEST
    assert_equal "Output: 0,0,WEST", robot.report
    robot.right
    robot.move
    # Assert robot moves
    assert_equal "Output: 0,1,NORTH", robot.report
  end
  def test_move_corner_north_east
    robot = Robot.new(4,4,"NORTH")
    robot.move
    # Assert move to the NORTH ignored
    assert_equal "Output: 4,4,NORTH", robot.report
    robot.right
    robot.move
    # Assert robot turned and ignored move to the EAST
    assert_equal "Output: 4,4,EAST", robot.report
    robot.right
    robot.move
    # Assert robot moves
    assert_equal "Output: 4,3,SOUTH", robot.report
  end
  def test_turn_right
    robot = Robot.new(0,0,"NORTH")
    assert_equal "Output: 0,0,NORTH", robot.report
    robot.right
    assert_equal "Output: 0,0,EAST", robot.report
    robot.right
    assert_equal "Output: 0,0,SOUTH", robot.report
    robot.right
    assert_equal "Output: 0,0,WEST", robot.report
    robot.right
    assert_equal "Output: 0,0,NORTH", robot.report
  end
  def test_turn_left
    robot = Robot.new(0,0,"NORTH")
    assert_equal "Output: 0,0,NORTH", robot.report
    robot.left
    assert_equal "Output: 0,0,WEST", robot.report
    robot.left
    assert_equal "Output: 0,0,SOUTH", robot.report
    robot.left
    assert_equal "Output: 0,0,EAST", robot.report
    robot.left
    assert_equal "Output: 0,0,NORTH", robot.report
  end
end
