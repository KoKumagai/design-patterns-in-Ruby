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

# Adapter
class IphoneAdapter
  def initialize(iphone)
    @iphone = iphone
  end

  def charge
    @iphone.charge_battery
  end
end


############## Usage ##############
charger = AppleWatchCharger.new
iphone = Iphone.new(60)

puts charger.execute(IphoneAdapter.new(iphone))
#=> 61