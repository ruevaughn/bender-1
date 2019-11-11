module BendersWorld
  OBJECTS = {
    inverter: 'I',
    bender: '@',
    suicide_booth: '$',
    boundary: '#',
    obstacle: 'X',
    teleporter: 'T'
  }.freeze
  class Map
    attr_accessor :lines
    attr_accessor :columns
    attr_accessor :bender

    def init(*attrs)
      @map = []
      @bender_placed = false
      @suicide_booth_placed = false
      @teleporters_placed = 0
    end

    def generate_map
      generate_map_size
      draw_map
    end

    def self.random_object
      [].tap do |available|
         available << BendersWorld::Objects[:bender] unless @bender_placed
         available << BendersWorld::Objects[:suicide_booth] unless @suicide_booth_placed
         available << BendersWorld::Objects[:teleports] unless @teleporters_placed.two?
         available << BendersWorld::Objects[:obstacle] unless @teleporters_placed.two?
      end
    end


    private

    def generate_map_size
      # l, c = gets.split(" ").collect {|x| x.to_i}
      # l.times do
      #     row = gets.chomp
      # end
      puts 'How Many Lines (4-100)'
      lines = gets.chomp
      puts 'How Many Columns (4-100)'
      columns = gets.chomp

      if lines.present? && columns.present?
        @lines = lines
        @columns = columns
      else
        puts 'Try Again'
        generate_map_size
      end
    end

    def draw_map
      horizontal_boundary
      @lines.times do |line|
        row = []
        @columns.times do |column|
          if column.zero?
            row << Map::OBJECTS[:boundary]
          elsif column == @columns.length
            row << Map::OBJECTS[:boundary] 
          else
            row << Map::random_object 
          end
        end
        @map << row
      end
      horizontal_boundary
    end

    def horizontal_boundary
      row = []
      @columns.times { row << MAP::OBJECTS[:boundary] }
      @map << row
    end
  end

  class Bender
    def init(*args)
      @direction_facing = Bender::DIRECTION_PRIORITY[0]
    end
    DIRECTION_PRIORITY          = {south: 'S', east: 'E', north: 'N', west: 'W'}.freeze
    DIRECTION_INVERTED_PRIORITY = {west: 'W', south: 'S', east: 'E', north: 'N'}.freeze

    attr_accessor :direction_facing


    def take_step
    end
  end

end

map = BendersWorld::Map.new
map.generate_map
puts map.map


# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

puts "answer"
