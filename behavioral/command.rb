# Command
class Button
  def initialize(action)
    @action = action
  end

  def click
    @action.execute
  end
end

# ConcreteCommand1
class PrintMessage
  def initialize(message)
    @message = message
  end

  def execute
    puts @message
  end
end

# ConcreteCommand2
class Beep
  def execute
  	print "\a"
  end
end


############### Usage ###############
button = Button.new(PrintMessage.new("Hello, World"))
button.click
#=> Hello, World

button = Button.new(Beep.new)
button.click
#=> Beep Sound