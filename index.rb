require_relative 'robot'

p robot = Robot.new(4,3,'WEST')

loop do
  puts '____________________________________________________________________________________________________'
  puts 'Allowed commands:'
  puts '    PLACE  - Create position and set course.'
  puts '    MOVE   - Moves robot one step forward in the direction to which it is now looking.'
  puts '    RIGHT  - Rotate the robot 90 degrees in the appropriate direction without changing its position.'
  puts '    LEFT   - Rotate the robot 90 degrees in the appropriate direction without changing its position.'
  puts '    REPORT - Displays the current coordinates of the robot (x, y) and current course (f)'
  puts '    EXIT   - To stop play.'
  robot.play
end

