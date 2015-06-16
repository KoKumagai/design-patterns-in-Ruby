# AbstractBuilder
class WhiskeyBuilder
  attr_reader :whiskey_with_something

  def initialize(builder)
    @whiskey_with_something = builder.new(0,0)
  end

  def add_something(something)
    @whiskey_with_something.add_something(something)
  end

  def add_whiskey(whiskey)
    @whiskey_with_something.whiskey += whiskey
  end
end

# ConcreteBuilder1
class WhiskeyWithWater
  attr_accessor :whiskey, :water
  def initialize(whiskey, water)
    @whiskey = whiskey
    @water = water
  end

  def add_something(water)
    @water += water
  end
end

# ConcreteBuilder2
class WhiskeyWithSoda
  attr_accessor :whiskey, :soda

  def initialize(whiskey, soda)
    @whiskey = whiskey
    @soda = soda
  end

  def add_something(soda)
    @soda += soda
  end
end

# Director
class Bartender
  def initialize(builder)
    @builder = builder
  end

  def make(whiskey, something)
    @builder.add_whiskey(whiskey)
    @builder.add_something(something)
    @builder.add_whiskey(whiskey)
    @builder.add_something(something)
  end
end


############### Usage ###############
builder = WhiskeyBuilder.new(WhiskeyWithWater)
bartender = Bartender.new(builder)
bartender.make(150, 90)
p builder.whiskey_with_something
#=> #<WhiskeyWithWater:0x007f9e0b13c698 @whiskey=300, @water=180>

builder = WhiskeyBuilder.new(WhiskeyWithSoda)
bartender = Bartender.new(builder)
bartender.make(110, 30)
p builder.whiskey_with_something
#=> #<WhiskeyWithSoda:0x007f9e0b13c4b8 @whiskey=220, @soda=60>