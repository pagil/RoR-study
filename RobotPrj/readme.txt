Content of the RobotPrj.
Folders:
/app  - this folder contains source code of the application in Ruby.
    /Launcher.rb
    /Robot.rb
    /RobotSimulator.rb
/data - this folder contains sample text files with commands for the Robot Simulator.
     /empty.txt
     /input1.txt
     /input2.txt
     /input3.txt
     /input_wrong.txt
/test - this folder contains Unit tests for Robot and RobotSimulator classes.
     /RobotSimulatorTest.rb
     /RobotTest.rb
Scripts:
/run.sh            - runs console only version of the application.
/run_with_file.sh  - sample script for running application with text file containing commands for the Robot Simulator.
/run_tests.sh - script which runs Unit tests for Robot and RobotSimulator classes.

NOTE:
If any of the sample text files with commands for the Robot Simulator is changed,
it is necessary to update ./test/RobotSimulatorTest.rb accordingly.

How to use (all commands below must be executed from RobotPrj folder):
1. To run console only application execute:
 /RobotPrj$ ./run.sh
2. To run sample script with /data/input1.txt file execute:
 /RobotPrj$ ./run_with_file.sh
3. To run all Unit tests execute
 /RobotPrj$ ./run_tests.sh
4. To run the application with any other file with commands execute:
 /RobotPrj$ ./run.sh <path to file>
 For example:
 /RobotPrj$ ./run.sh data/input3.txt
