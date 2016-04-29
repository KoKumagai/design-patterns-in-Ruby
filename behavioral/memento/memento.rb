# Memento
class Memento
  attr_accessor :state

  def initialize(state)
    @state = state
   end
end

# Originator
class Originator
  attr_accessor :state

  def create_memento
    @memento = Memento.new(@state)
  end

  def restore_memento(memento)
    @memento = memento
    @state  = memento.state
  end
end

# Caretaker
class Caretaker
  def initialize
    @mementos = Array.new
  end

 def add_memento(memento)
    @mementos << memento
  end

  def get_memento(index)
    @mementos[index]
  end
end


############### Usage ###############
caretaker  = Caretaker.new
originator = Originator.new

originator.state = "first"
caretaker.add_memento(originator.create_memento)

originator.state = "second"
caretaker.add_memento(originator.create_memento)
puts originator.state
#=> second

originator.state = "third"
puts originator.state
#=> third

originator.restore_memento(caretaker.get_memento(1))
puts originator.state
#=> second

originator.restore_memento(caretaker.get_memento(0))
puts originator.state
#=> first