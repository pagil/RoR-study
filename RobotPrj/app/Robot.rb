# This immutable class encapsulates implementation of the Toy Robot
class Robot

  SIZE = 4

  # Create the object
  def initialize(x,y,direction)
    @x = validateCoordinate(x)
    @y = validateCoordinate(y)
    @direction = validateDirection(direction)
  end

  # Moves the Robot one unit forward in the direction it is currently facing
  def move
    case @direction
      when "NORTH"
        @y = increment(@y)
      when "WEST"
        @x = decrement(@x)
      when "SOUTH"
        @y = decrement(@y)
      when "EAST"
        @x = increment(@x)
    end
  end

  private def validateCoordinate(coordinate)
    if (coordinate < 0) || (coordinate > SIZE)
      raise "Illegal argument exception: coordinate"
    else
      return coordinate
    end
  end

  private def validateDirection(direction)
    if !(direction =~ /\A(north|south|west|east)\z/i)
      raise "Illegal argument exception: direction"
    else
      return direction
    end
  end

  private def decrement(coordinate)
    if (coordinate > 0)
      coordinate -= 1
    end
    return coordinate
  end

  private def increment(coordinate)
    if (coordinate < SIZE)
      coordinate += 1
    end
    return coordinate
  end

  # Turn the Robot 90 degrees anticlockwise
  def left
    case @direction
      when "NORTH"
        @direction = "WEST"
      when "WEST"
        @direction = "SOUTH"
      when "SOUTH"
        @direction = "EAST"
      when "EAST"
        @direction = "NORTH"
    end
  end

  # Turn the Robot 90 degrees clockwise
  def right
    case @direction
      when "NORTH"
        @direction = "EAST"
      when "EAST"
        @direction = "SOUTH"
      when "SOUTH"
        @direction = "WEST"
      when "WEST"
        @direction = "NORTH"
    end
  end

  # Prints out the x, y and direction of the robot
  def report
    resultString = "Output: #{@x},#{@y},#{@direction}"
    # Print it here instead of RobotSimulator.rb
    # because the report can be called from file
    puts resultString
    return resultString
  end
end
