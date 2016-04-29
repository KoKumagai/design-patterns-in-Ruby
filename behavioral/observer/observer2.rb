class Email
  attr_accessor :from, :to, :title, :message 
  
  def initialize(from, to, title, message)
    @from = from
    @to = to
    @title = title
    @message = message
  end

  def send
    puts "From: #{@from}"
    puts "To: #{@to}"
    puts "Title: #{@title}"
    puts "Message: #{@message}"
  end
end

# Subject
module Subject
  attr_reader :observer

  def add_observer(&observer)
    @observer = observer
  end

  def notify_observer
    @observer.call
  end
end

# Observer
class Person
  include Subject
  attr_accessor :name

  def initialize(name)
      @name = name
  end

  def send_email(email)
    email.send
    notify_observer
  end
end


############### Usage ###############
ko = Person.new("Ko")

# ConcreteObserver
ko.add_observer do
  puts "Alert: #{ko.name} sent an email"
end
ko.send_email(Email.new("Ko", "Matz", "The Ruby", "I love Ruby"))
#=> From: Ko
#=> To: Matz
#=> Title: The Ruby
#=> Message: I love Ruby
#=> Alert: Ko sent an email