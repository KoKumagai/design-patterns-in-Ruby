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


############## Usage ##############
msg = Messenger.new("Ko")

# Decorator1
class << msg
  alias old_send_message send_message

  def send_message(message)
    old_send_message("#{message} lol")
  end
end

msg.add_title("Hi")
msg.send_message("Hello, World")
#=> To: Ko
#=> Title: Hi
#=> Msg: "Hello, World lol"


msg = Messenger.new("Ko")

# Decorator2
class << msg
  alias old_send_message send_message

  def send_message(message)
    old_send_message("#{message} :-)")
  end
end

msg.add_title("Hi")
msg.send_message("Hello, World")
#=> To: Ko
#=> Title: Hi
#=> Msg: "Hello, World :-)"


msg = Messenger.new("Ko")

# Decorator1&2
class << msg
  alias old_send_message send_message

  def send_message(message)
    old_send_message("#{message} :-) lol")
  end
end

msg.add_title("Hi")
msg.send_message("Hello, World")
#=> To: Ko
#=> Title: Hi
#=> Msg: "Hello, World :-) lol"