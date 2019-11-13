require 'pry'

class Map
  OBJECTS = {
    bender: '@',
    beer: 'B',
    boundary: '#',
    inverter: 'I',
    obstacle: 'X',
    suicide_booth: '$',
    teleporter: 'T',
    open_space: ' '
  }.freeze

  attr_accessor :rows
  attr_accessor :columns
  attr_accessor :remaining_columns
  attr_accessor :map
  attr_accessor :bender

  attr_reader :suicide_booth

  def initialize
    @generated_map = []
    @bender_placed = false
    @suicide_booth_placed = false
    @teleporters_placed = 0
    @random_obstacles_count = random_obstacle_count
  end

  def generate_map
    prompt_map_size
    set_limits
    draw_map
  end

  def square_map_size
    @rows * @columns
  end

  def set_limits
    if square_map_size <= 25
      @max_obstacles = 4
      @max_beer = 2
    elsif square_map_size <= 500
      @max_obstacles = 20
      @max_beer = 10
    end

  end

  def display_map
    @generated_map.each do |row|
      puts row.join('');
    end
  end


  def prompt_map_size
    puts 'How Many Lines(rows) (4-100)'
    @rows = gets.chomp.to_i
    puts 'How Many Columns (4-100)'
    @columns = gets.chomp.to_i
    if valid_input?
      @available_columns = @columns
    else
      puts "Rows and Columns cannot be less than 4 or greater than 100"
      prompt_map_size
    end
  end

  def available_columns
    @available_columns = ((@rows * 2) + (@columns * 2))
  end

  def draw_map
    @rows.times do |row_index|
      if row_index.zero? || row_index == total_rows
        @generated_map << draw_horizontal_row(row_index)
      else
        @generated_map << draw_row(row_index)
      end
    end
  end

  def draw_horizontal_row(row_index)
    [] << '#'* @columns
  end

  def draw_row(row_index)
      [].tap do |row|
        @columns.times do |column_index|
          row << column_object(row_index, column_index)
      end
    end
  end

  def column_object(row_index, column_index)
    if column_index.zero? || column_index >= total_columns
      Map::OBJECTS[:boundary]
    else
      object = select_random_object
      if object == Map::OBJECTS[:bender]
        @bender_placed = true
        @bender_location = @map[row_index][column_index]
      elsif object == Map::OBJECTS[:suicide_booth]
        @suicide_booth_placed = true
      end
    end
  end

  private

  def random_obstacle_count
    (rand * 6).to_i
  end

  def valid_input?
    (@rows <= 4 || @rows >= 100) || (@columns <= 4 || @columns >= 100) ? false : true
  end

  def first_column_index
    @columns.first
  end

  def last_column_index
    @columns.last
  end

  def first_row_index
    @rows.first
  end

  def last_row_index
    @rows.last
  end

  def rand_booth
    available_columns
  end

  def select_random_object
    available = []
    available << Map::OBJECTS[:suicide_booth] unless @suicide_booth_placed
    # available << Map::OBJECTS[:teleporter] unless @teleporters_placed >= 2
    # available << Map::OBJECTS[:obstacle]
    available << Map::OBJECTS[:open_space]
    available << Map::OBJECTS[:bender] unless @bender_placed
    object = available.sample


    object
  end

  # def handle_column(block)
  #   @columns.each do
  #     yield block
  #   end
  # end

  def total_columns
    @columns - 1
  end

  def total_rows
    @rows - 1
  end

end

class Bender
  DIRECTION          = {south: 'S', east: 'E', north: 'N', west: 'W'}.freeze
  DIRECTION_INVERTED = {west: 'W', south: 'S', east: 'E', north: 'N'}.freeze

  attr_accessor :breaker_mode
  def initialize
    @direction = Bender::DIRECTION[0]
    @location =
    @breaker_mode = false
  end

  def next_step
    check_direction
  end

  def check_direction
    @direction
  end

end
bender = Bender.new
map = Map.new
map.generate_map
map.display_map


# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

puts "answer"
