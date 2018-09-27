# frozen_string_literal: true

class Robot

  def initialize(pos_x, pos_y, facing, max_x = 5, max_y = 6)
    @pos_x = pos_x
    @pos_y = pos_y
    @max_x = max_x
    @max_y = max_y
    @facing = facing
  end

  def play
    command = gets.chomp
    puts "Invalid command line agrument: #{command}" unless %w[PLACE MOVE RIGHT LEFT REPORT EXIT].include? command

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
      return
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

  def report
    puts "Hi, now I am here: #{@pos_x}, #{@pos_y}, #{@facing}"
  end
end
