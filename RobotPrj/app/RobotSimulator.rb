require_relative 'Robot'

# This class encapsulates help content for the Toy Robot Simulator commands
class Help
  def printGreeting
    puts "********************************"
    puts " Welcome to Toy Robot Simulator"
    puts "********************************"
    puts " HINT: The first valid command"
    puts " to the Robot is a PLACE command"
    puts "********************************"
  end
  def printHelp
    puts "Available commands:"
    puts "PLACE X,Y,DIRECTION"
    puts "MOVE"
    puts "LEFT"
    puts "RIGHT"
    puts "REPORT"
    puts "HELP"
    puts "EXIT"
  end
end

# This class encapsulates implementation of the Toy Robot Simulator
class RobotSimulator

  attr_reader :robot

  # Constructor for input from file mode
  def initialize(fileName=nil)
    @help = Help.new
    @help.printGreeting
    @help.printHelp
    if (fileName)
      initRobotFromFile(fileName)
    else
      @robot = nil
    end
  end

  # This method contains infinite loop for interaction with a user
  def mainAppLoop
    loop do
      input = STDIN.gets.chomp
      performCommand(input)
    end
  end

  # Executes specified operation on the Robot instance or creates new
  # instance of the Robot class if PLACE command received
  def performCommand (input, lineNumber=nil)
    case input
      when /\Aplace [0-4],[0-4],(north|south|west|east)\z/i
        subStrs = input.upcase.split(/[\s,]/)
        @robot = Robot.new(subStrs[1].to_i,subStrs[2].to_i,subStrs[3])
      when /\Amove\z/i
        @robot.move if (@robot)
      when /\Aleft\z/i
        @robot.left if (@robot)
      when /\Aright\z/i
        @robot.right if (@robot)
      when /\Areport\z/i
        @robot.report if (@robot)
      when /\Ahelp\z/i
        @help.printHelp
      when /\Aexit\z/i
        abort "Thanks for playing with Robot. Bye!"
      else
        puts "Invalid command"
        puts "\tFile line number: #{lineNumber}" if (lineNumber)
    end
  end

  # Reads commands for the Robot from specified file
  private def initRobotFromFile(fileName)
    f = File.open(fileName) if File::exists?(fileName)
    if (f)
      text = f.read
      f.close
      lines = text.split(/[\r\n]/)
      lineNumber=0
      lines.each do |line|
        lineNumber += 1
        performCommand(line, lineNumber)
      end
    else
      puts "Cannot find file: #{fileName}"
    end
  end
end
