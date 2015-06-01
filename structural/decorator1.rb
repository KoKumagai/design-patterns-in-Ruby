require "forwardable"

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
class LolMessenger
  extend Forwardable

  def_delegator :@base_messenger, :add_title

  def initialize(base_messenger)
    @base_messenger = base_messenger
    @lol = "lol"
  end
  
  def send_message(message)
    @base_messenger.send_message("#{message} #{@lol}")
  end
end

# Decorator2
class SmilingMessenger
  extend Forwardable

  def_delegator :@base_messenger, :add_title

  def initialize(base_messenger)
    @base_messenger = base_messenger
    @smile = ":-)"
  end

  def send_message(message)
    @base_messenger.send_message("#{message} #{@smile}")
  end
end


############## Usage ##############
msg = LolMessenger.new(Messenger.new("Ko"))
msg.add_title("Hi")
msg.send_message("Hello, World")
#=> To: Ko
#=> Title: Hi
#=> Msg: "Hello, World lol"

msg = SmilingMessenger.new(Messenger.new("Ko"))
msg.add_title("Hi")
msg.send_message("Hello, World")
#=> To: Ko
#=> Title: Hi
#=> Msg: "Hello, World :-)"

msg = SmilingMessenger.new(LolMessenger.new(Messenger.new("Ko")))
msg.add_title("Hi")
msg.send_message("Hello, World")
#=> To: Ko
#=> Title: Hi
#=> Msg: "Hello, World :-) lol"