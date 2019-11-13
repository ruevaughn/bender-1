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
    open_space: '\w'
  }.freeze

  attr_accessor :rows
  attr_accessor :columns
  attr_accessor :map

  def initialize (*attrs)
    @map = []
    @bender_placed = false
    @suicide_booth_placed = false
    @teleporters_placed = 0
    @random_obstacles_count = random_obstacle_count
  end

  def generate_map
    prompt_map_size
    draw_map
  end

  def display_current_map
    @map.each do |rows|
      puts rows
      rows.each do |column|
      end
    end

  end

  def prompt_map_size
    puts 'How Many Lines(rows) (4-100)'
    @rows = gets.chomp.to_i
    puts 'How Many Columns (4-100)'
    @columns = gets.chomp.to_i
    check_valid_input
  end

  def draw_map
    @rows.times do |i|
      if i.zero?
        current_row = horizontal_boundary
      elsif i == total_rows
        current_row = horizontal_boundary
      else
        current_row = draw_row(i)
      end
      @map << current_row
    end
  end

  def draw_row(row_index)
    row = []
    @columns.times do |j|
      row << column_object(row, j)
    end
    row
  end

  def column_object(row, column_index)
    if column_index.zero?
      row << Map::OBJECTS[:boundary]
    elsif column_index == total_columns
      row << Map::OBJECTS[:boundary]
    else
      row << Map::OBJECTS[:random_object]
    end
  end

  private

  def random_obstacle_count
    (rand * 6).to_i
  end

  def check_valid_input
    if  @rows <= 4 || @rows >= 100
      puts "Rows cannot be less than 4 or greater than 10."
    elsif @columns <= 4 || @colmns >= 100)
      && @columns >= 4 && columns <= 100)
      puts 'Please Try Again'
      generate_map_size
    end
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

  def self.random_object
    available = []
    available << Map::OBJECTS[:bender] unless @bender_placed
    available << Map::OBJECTS[:suicide_booth] unless @suicide_booth_placed
    available << Map::OBJECTS[:teleports] unless @teleporters_placed.two?
    available << Map::OBJECTS[:obstacle]
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

  def horizontal_boundary
    row = []
    @columns.times do |column_index|
      if column_index.zero?
        row << Map::OBJECTS[:boundary]
      elsif column_index == @columns - 1
        row << Map::OBJECTS[:boundary]
      else
       row << Map::OBJECTS[:open_space]
      end
    end
    @map << row
  end
end

class Bender
  DIRECTION          = {south: 'S', east: 'E', north: 'N', west: 'W'}.freeze
  DIRECTION_INVERTED = {west: 'W', south: 'S', east: 'E', north: 'N'}.freeze

  attr_accessor :breaker_mode
  def initialize
    @direction = Bender::DIRECTION[0]
    @breaker_mode = false
  end

  def next_step
  end

end
map = Map.new
map.generate_map
puts map.map


# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

puts "answer"
