require_relative 'robot'

robot = Robot.new(3, 4, 'WEST', 5, 6)
robot.table_size
robot.place
puts 'Robot in table!'
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
