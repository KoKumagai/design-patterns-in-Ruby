# Client
class AppleWatchCharger
  def execute(device)
    device.charge
  end
end

# Target
class AppleWatch
  def initialize(battery_percentage)
    @battery_percentage = battery_percentage
  end

  def charge
    @battery_percentage +=1
  end
end

# Adaptee
class Iphone
  def initialize(battery_percentage)
    @battery_percentage = battery_percentage
  end
  
  def charge_battery
    @battery_percentage +=1
  end
end

# Adapter
iphone = Iphone.new(60)
class << iphone
  def charge
    charge_battery
  end
end


############## Usage ##############
charger = AppleWatchCharger.new

puts charger.execute(iphone)
#=> 61