# AbstractClass
class Sandwich
  def initialize(bread, condiment)
    @bread = bread
    @condiment = condiment
  end
 
  def make
    arrange_bread
    spread_condiment
    put_vegetable
    put_filling
  end
 
  def arrange_bread
    puts "arranged #{@bread}"
  end

  def spread_condiment
    puts "spreaded #{@condiment}"
  end

  def put_vegetable; end

  def put_filling
    raise NotImplementedError, "You should implement #{self.class}##{__method__}"
  end
end
 
# ConcreteClass1
class MeatSandwich < Sandwich
  def initialize(bread, condiment)
    super
  end

  def put_filling
    puts "put Ham, sausage"
  end
end

# ConcreteClass2
class EggSaladSandwich < Sandwich
  def initialize(bread, condiment, vegetable)
    super(bread, condiment)
    @vegetable = vegetable
  end

  def put_vegetable
    puts "put #{@vegetable}"
  end

  def put_filling
    puts "put Egg"
  end
end


############### Usage ###############
meat_sandwich = MeatSandwich.new("Italian Bread", "Ketchup")
meat_sandwich.make
#=> arranged Italian Bread
#=> spreaded Ketchup
#=> put Ham, sausage

egg_sandwich = EggSaladSandwich.new("Flat Bread", "Butter", "Lettuce")
egg_sandwich.make
#=> arranged Flat Bread
#=> spreaded Butter
#=> put Lettuce
#=> put Egg