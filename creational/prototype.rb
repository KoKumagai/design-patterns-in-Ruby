# Prototype
class Person
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def say_name
    puts "My name is #{@name}"
  end

  def create_clone
    self.clone
  end
end


############### Usage ###############
ko = Person.new("Ko")
cloned_ko = ko.create_clone

ko.say_name
#=> My name is Ko
cloned_ko.say_name
#=> My name is Ko