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
  def initialize(base_messenger)
    @base_messenger = base_messenger
    @lol = "lol"
  end
  
  def method_missing(method, *args)
    return @base_messenger.send method, "#{args[0]} #{@lol}" if method == :send_message
    @base_messenger.send method, *args
  end
end

# Decorator2
class SmilingMessenger
  def initialize(base_messenger)
    @base_messenger = base_messenger
    @smile = ":-)"
  end

  def method_missing(method, *args)
    return @base_messenger.send method, "#{args[0]} #{@smile}" if method == :send_message
    @base_messenger.send method, *args
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