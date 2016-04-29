# AbstractFactory
class Os
  def create_browser
    raise NotImplementedError, "You should implement #{self.class}##{__method__}"
  end
end

# AbstractProduct
class Browser
  def render
    raise NotImplementedError, "You should implement #{self.class}##{__method__}"
  end
end

# ConcreteFactory1
class Osx < Os
  def create_browser
    Safari.new
  end
end

# ConcreteFactory2
class Windows < Os
  def create_browser
    InternetExplorer.new
  end
end

# ConcreteProduct1
class Safari < Browser
  def render
    puts "Safari is rendering."
  end
end

# ConcreteProduct2
class InternetExplorer < Browser
  def render
    puts "IE is rendering."
  end
end

# Client
class Computer
  def initialize(os)
    @os = os
  end

  def browse
    brower = @os.create_browser
    brower.render
  end
end


############### Usage ###############
mac = Computer.new(Osx.new)
mac.browse
# => Safari is rendering.

hp = Computer.new(Windows.new)
hp.browse
# => IE is rendering.