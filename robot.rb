class Robot

  ALLOWED_COMMAND = %w[PLACE MOVE RIGHT LEFT REPORT EXIT].freeze
  ALLOWED_FACING = %w[NORTH EAST WEST SOUTH].freeze

  def initialize(pos_x, pos_y, facing, max_x, max_y)
    @pos_x = pos_x
    @pos_y = pos_y
    @max_x = max_x
    @max_y = max_y
    @facing = facing
  end

  def place
    pos_x = 0
    pos_y = 0
    facing = ''
    loop do
      puts "Enter current position for robot, first position (X), min (X) = 0, max (X) = #{@max_x}:"
      pos_x = gets.chomp.to_i
      puts "Enter position (Y) for robot, min (Y) = 0, max (Y) = #{@max_y}:"
      pos_y = gets.chomp.to_i
      puts "Enter current facing (F), (allowed facing 'NORTH' 'EAST' 'WEST' 'SOUTH'):"
      facing = gets.chomp.upcase
      puts "Incorrect position #{pos_x}, #{pos_y}, #{facing}, try Enter valid position again" unless valid_position?(pos_x, pos_y, facing)
      break if valid_position?(pos_x, pos_y, facing)
    end
    set_robot(pos_x, pos_y, facing)
  end

  def play
    command = gets.chomp
    puts "Invalid command line agrument: #{command}" unless ALLOWED_COMMAND.include? command

    case command
    when 'PLACE'
      place
    when 'MOVE'
      move
    when 'RIGHT'
      right
    when 'LEFT'
      left
    when 'REPORT'
      puts "#{report}"
    when 'EXIT'
      puts 'Good bye'
      exit(0)
    end
  end

  def move
    case @facing
    when 'NORTH'
      @pos_y += 1 unless @pos_y == @max_y
    when 'EAST'
      @pos_x += 1 unless @pos_x == @max_x
    when 'WEST'
      @pos_x -= 1 unless @pos_x.zero?
    when 'SOUTH'
      @pos_y -= 1 unless @pos_y.zero?
    end
  end

  def left
    case @facing
    when 'WEST'
      @facing = 'SOUTH'
    when 'SOUTH'
      @facing = 'EAST'
    when 'EAST'
      @facing = 'NORTH'
    when 'NORTH'
      @facing = 'WEST'
    end
  end

  def right
    case @facing
    when 'WEST'
      @facing = 'NORTH'
    when 'SOUTH'
      @facing = 'WEST'
    when 'EAST'
      @facing = 'SOUTH'
    when 'NORTH'
      @facing = 'EAST'
    end
  end

  def valid_position?(pos_x, pos_y, facing)
    return true if (0..@max_x).to_a.include?(pos_x) && (0..@max_y).to_a.include?(pos_y) && ALLOWED_FACING.include?(facing)
  end

  def set_robot(pos_x, pos_y, facing)
    @pos_x = pos_x
    @pos_y = pos_y
    @facing = facing
  end

  def set_table_size(max_x, max_y)
    @max_x = max_x
    @max_y = max_y
  end

  def table_size
    max_x = 0
    max_y = 0
    loop do
      puts 'Enter size (X) of table or press Enter to use default (X = 5):'
      max_x = gets.chomp.to_i
      puts 'Enter size (Y) of table or press Enter to use default (Y = 6):'
      max_y = gets.chomp.to_i
      puts "Incorrect size #{max_x}, #{max_y}, try Enter valid size" unless max_x >= 0 || max_y >= 0
      break if max_x >= 0 && max_y >= 0
    end
    if max_x.zero? && max_y.zero?
      set_table_size(5, 6)
    else
      set_table_size(max_x, max_y)
    end
  end

  def report
    puts "Hi, now I am here: #{@pos_x}, #{@pos_y}, #{@facing}"
  end
end
