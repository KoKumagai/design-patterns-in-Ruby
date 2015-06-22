# Client
class AppleWatchCharger
  def execute(device)
    device.charge
  end
end

# Target
class AppleWatch
  attr_reader :battery_percentage

  def initialize(battery_percentage)
    @battery_percentage = battery_percentage
  end

  def charge
    @battery_percentage +=1
  end
end

# Adaptee
class Iphone
  attr_reader :battery_percentage

  def initialize(battery_percentage)
    @battery_percentage = battery_percentage
  end
  
  def charge_battery
    @battery_percentage +=1 unless @battery_percentage >= 100
  end
end


############## Usage ##############
# Adapter
iphone = Iphone.new(60)
class << iphone
  def charge
    charge_battery
  end
end

apple_watch_charger = AppleWatchCharger.new

puts apple_watch_charger.execute(iphone)
#=> 61