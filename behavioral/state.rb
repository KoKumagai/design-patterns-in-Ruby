# State1
class Red
  def print_signal
    puts "The traffic light is Red"
  end
end

# State2
class Yellow
  def print_signal
    puts "The traffic light is Yellow"
  end
end

# State3
class Green
  def print_signal
    puts "The traffic light is Green"
  end
end

# Context
class TrafficLight
  attr_accessor :state

  def signal
    @state.print_signal
  end
end


############### Usage ###############
traffic_light = TrafficLight.new
red = Red.new
yellow = Yellow.new
green = Green.new

traffic_light.state = red
traffic_light.signal
#=> The traffic light is Red

traffic_light.state = yellow
traffic_light.signal
#=> The traffic light is Yellow

traffic_light.state = green
traffic_light.signal
#=> The traffic light is Green