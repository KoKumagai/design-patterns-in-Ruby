# Component
class Messenger
  def initialize(name)
    @to = name
  end

  def add_title(title)
    @title = title
  end
  
  def send_message(message)
    puts "To: #{@to}"
    puts "Title: #{@title}" if @title
    puts "Msg: \"#{message}\""
  end
end

# Decorator1
module LolMessenger
  def send_message(message)
    super("#{message} lol")
  end
end

# Decorator2
module SmilingMessenger
  def send_message(message)
    super("#{message} :-)")
  end
end


############## Usage ##############
msg = Messenger.new("Ko")
msg.extend(LolMessenger)
msg.add_title("Hi")
msg.send_message("Hello, World")
#=> To: Ko
#=> Title: Hi
#=> Msg: "Hello, World lol"

msg = Messenger.new("Ko")
msg.extend(SmilingMessenger)
msg.add_title("Hi")
msg.send_message("Hello, World")
#=> To: Ko
#=> Title: Hi
#=> Msg: "Hello, World :-)"

msg = Messenger.new("Ko")
msg.extend(LolMessenger)
msg.extend(SmilingMessenger)
msg.add_title("Hi")
msg.send_message("Hello, World")
#=> To: Ko
#=> Title: Hi
#=> Msg: "Hello, World :-) lol"