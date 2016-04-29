# Flyweight1
class Apple
  def peel
    puts "peeled an apple"
  end
end

# Flyweight2
class Orange
  def peel
    puts "peeled an orange"
  end
end

# FlyweightFactory
class FruitFactory
  @@apple = nil
  @@orange = nil

  def initialize
    @@apple = Apple.new unless @@apple
    @@orange = Orange.new unless @@orange
  end

  def get_fruit(fruit) 
    if(fruit == "apple")
      @@apple
    elsif(fruit == "orange")
      @@orange
    end
  end
end


############## Usage ##############
factory = FruitFactory.new

apple1 = factory.get_fruit("apple")
apple2 = factory.get_fruit("apple")

puts apple1.object_id == apple2.object_id
#=> true

orange1 = factory.get_fruit("orange")
orange2 = factory.get_fruit("orange")

puts orange1.object_id == orange2.object_id
#=> true

fruits = [factory.get_fruit("apple"), factory.get_fruit("apple"), factory.get_fruit("orange")]

fruits.each{ |fruit| fruit.peel }
#=> peeled an apple
#=> peeled an apple
#=> peeled an orange