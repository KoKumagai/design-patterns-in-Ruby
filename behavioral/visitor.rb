# Acceptor1
class Motherboard
  attr_accessor :brand, :model

  def initialize(brand, model)
    @brand = brand
    @model = model
  end

  def accept(visitor)
    visitor.visit(self)
  end
end

# Acceptor2
class Cpu
  attr_accessor :brand, :model

  def initialize(brand, model)
    @brand = brand
    @model = model
  end

  def accept(visitor)
    visitor.visit(self)
  end
end

# Acceptor3
class Dram
  attr_accessor :brand, :model

  def initialize(brand, model)
    @brand = brand
    @model = model
  end

  def accept(visitor)
    visitor.visit(self)
  end
end

# Acceptor4
class Hdd
  attr_accessor :brand, :model

  def initialize(brand, model)
    @brand = brand
    @model = model
  end

  def accept(visitor)
    visitor.visit(self)
  end
end

# Acceptor5
class Computer
  def initialize(motherboard, cpu, dram, hdd)
    @parts = Array.new
    @parts << motherboard
    @parts << cpu
    @parts << dram
    @parts << hdd
  end

  def accept(visitor)
    @parts.each do |part|
      part.accept(visitor)
    end
  end
end

# Visitor1
class ComputerPrintBrand
  def visit(acceptor)
    puts "Brand: #{acceptor.brand}"
  end
end

# Visitor2
class ComputerPrintModel
  def visit(acceptor)
    puts "Model: #{acceptor.model}"
  end
end


############### Usage ###############
motherboard = Motherboard.new("ASUS", "X99-DELUXE")
cpu = Cpu.new("Intel", "Core i7-5960X")
dram = Dram.new("Crucial", "DDR4 PC4-17000")
hdd = Hdd.new("Seagate", "STBD4000400")
computer = Computer.new(motherboard, cpu, dram, hdd)

computer.accept(ComputerPrintBrand.new)
#=> Brand: ASUS
#=> Brand: Intel
#=> Brand: crucial
#=> Brand: Seagate
computer.accept(ComputerPrintModel.new)
#=> Model: X99-DELUXE
#=> Model: Core i7-5960X
#=> Model: DDR4 PC4-17000
#=> Model: STBD4000400