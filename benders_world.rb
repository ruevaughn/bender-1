module Map
  OBSTACLES = {'I' => 'INVERTER', '@' => 'Bender', '$' => "SUICIDE_BOOTH", '#' => 'OBSTACLE', 'X' => 'OBSTACLE'}
    , #, X, @, $, B, I, T ].freeze
  DIRECTION_PRIORITY = {'S' => 'SOUTH', 'E' => 'EAST', 'N' => 'North', 'W' => 'West'}
  DIRECTION_INVERTED_PRIORITY = {'W' => 'West', 'S' => 'SOUTH', 'E' => 'EAST', 'N' => 'North', }
  def generate
    get_size

  end

  def get_size
    puts "This is Rick and Morty here generating Benders journey home.. *burp* just a few questions"
    puts "How many far east - west do you want this drunken depressed slob to walk? (enter a number 4-100)"
    gets lines
    puts "What about north - south (enter a number 4-100)"
    gets columns
  end
end
module Journey
  def start_walking_sideways
    puts "You are bender. A misunderstood, innocent being. Never harmed a soul. You've had enough - you just want to get home."
    puts "No, not to your house. Home. Where you came from. Where it all began. Drowning in sorrow, Bender, walking sideways"
    puts "Begins his slow pity filled journey to the suicide booth. Unknowingly, something, whether his conscience, or this program"
    puts "Something will (ideally) stop him. Let's see this Journey play out."
  end
end

class Bender
  attr_accessor :direction_facing
  attr_accessor :obstacles
  
  def init(*args)

  end

  def take_step
  end

end

l, c = gets.split(" ").collect {|x| x.to_i}
l.times do
    row = gets.chomp
end

# Write an action using puts
# To debug: STDERR.puts "Debug messages..."

puts "answer"
