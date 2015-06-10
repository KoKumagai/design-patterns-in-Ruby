# Mediator
class Mediator
  def initialize
    @colleagues = Hash.new
  end

  def create_colleagues(colleague)
    @colleagues[colleague.name] = colleague
  end

  def consultation(colleague, to, msg)
    puts "From: #{colleague.name}"
    puts "To: #{to}"
    @colleagues[to].read_msg(msg)
  end
end

# Colleague
class Colleague
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def send_msg(to, msg)
    @mediator.consultation(self, to, msg)
  end

  def read_msg(msg)
    puts "Msg: #{msg}"
  end

  def set_mediator(mediator)
    @mediator = mediator
  end
end


############## Usage ##############
mediator = Mediator.new
ko = Colleague.new("Ko")
matz = Colleague.new("Matz")

mediator.create_colleagues(matz)
ko.set_mediator(mediator)

ko.send_msg("Matz", "I love Ruby.")


