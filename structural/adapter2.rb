# Client
class AppleWatchCharger
  def execute(device)
    device.charge
  end
end

# Target
class AppleWatch
  attr_reader :battery

  def initialize(battery)
    @battery = battery
  end

  def charge
    @battery +=1
  end
end

# Adaptee
class Iphone
  attr_reader :battery

  def initialize(battery)
    @battery = battery
  end
  
  def charge_battery
    @battery +=1 unless @battery >= 100
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