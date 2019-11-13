require 'pry'

class Map
  OBJECTS = {
    bender: '@',
    beer: 'B',
    boundary: '#',
    inverter: 'I',
    obstacle: 'X',
    suicide_booth: '$',
    teleporter: 'T'
  }.freeze

  attr_accessor :rows
  attr_accessor :columns
  attr_accessor :map

  def initialize(*attrs)
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

  def prompt_map_size
    puts 'How Many Lines(rows) (4-100)'
    @rows = gets.chomp.to_i
    puts 'How Many Columns (4-100)'
    @columns = gets.chomp.to_i
    check_valid_input
  end

  def draw_rows
    @rows.times do |row_count|
      draw_row(row_count)
    end
  end

  def draw_row(row_count)
    current_row = []
    current_column = @columns.times do |column_count|
      get_row_column_object(current_row, column_count)
    end
    current_row << current_column
  end

  def get_row_column_object(current_row, column_count)
    if column_count.zero?
      current_row << Map::OBJECTS[:boundary]
    elsif column_count == @columns.size
      current_row << Map::OBJECTS[:boundary]
    else
      current_row << Map::OBJECTS[:random_object]
    end
  end

  def draw_map
    horizontal_boundary
    current_row = draw_rows
    @map << current_row
    horizontal_boundary
  end

  private

  def random_obstacle_count
    (rand * 6).to_i
  end

  def check_valid_input
    unless (@rows >= 4 && @rows <= 100 && @columns >= 4 && columns <= 100)
      puts 'Please Try Again'
      generate_map_size
    end

  end

  def self.random_object
    available = []
    available << Map::OBJECTS[:bender] unless @bender_placed
    available << Map::OBJECTS[:suicide_booth] unless @suicide_booth_placed
    available << Map::OBJECTS[:teleports] unless @teleporters_placed.two?
    available << Map::OBJECTS[:obstacle]
  end

  def horizontal_boundary
    row = []
    @columns.times { row << Map::OBJECTS[:boundary] }
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
