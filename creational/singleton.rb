require 'singleton'

class MySingleton
  include Singleton

  attr_accessor :counter

  def initialize
    @counter = 0
  end
end


############## Usage ##############
obj1 = MySingleton.instance
obj1.counter += 1
puts obj1.counter
#=> 1

obj2 = MySingleton.instance
obj2.counter += 1
puts obj2.counter
#=> 2

puts obj1.object_id == obj2.object_id
#=> true


obj3 = MySingleton.new
#=> private method `new' called for MySingleton:Class (NoMethodError)

obj1.clone
#=> `clone': can't clone instance of singleton MySingleton (TypeError)

obj1.dup
#=> `dup': can't dup instance of singleton MySingleton (TypeError)