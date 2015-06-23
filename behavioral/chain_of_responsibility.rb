# Handler
class ImmigrationSystem
  def set_next(next_obj)
    @next = next_obj
  end

  def examine(person)
    if(check(person))
      true
    elsif(@next != nil)
      @next.examine(person)
    else
      puts "NG"
    end
  end
end

# ConcreteHandler1
class FederalSkilledWorkerProgram < ImmigrationSystem
  def check(person)
    return false unless person.work_level > 3 && person.experience > 4
    puts "FSW: #{person.name} is OK"
    true
  end
end

# ConcreteHandler2
class FederalSkilledTradesProgram < ImmigrationSystem
  def check(person)
    return false unless person.work_level > 6
    puts "FST: #{person.name} is OK"
    true
  end
end

# ConcreteHandler3
class CanadianExperienceClass < ImmigrationSystem
  def check(person)
    return false unless person.experience > 7
    puts "CEC: #{person.name} is OK"
    true
  end
end

class Person
  attr_accessor :name, :work_level, :experience

  def initialize(name, work_level, experience)
    @name = name
    @work_level = work_level
    @experience = experience
  end
end


############### Usage ###############
ko = Person.new("Ko", 7, 5)
james = Person.new("James", 7, 3)
mary = Person.new("Mary", 2, 10)
robert = Person.new("Robert", 5, 2)

fskp = FederalSkilledWorkerProgram.new
fstp = FederalSkilledTradesProgram.new
cec = CanadianExperienceClass.new
fskp.set_next(fstp).set_next(cec)

fskp.examine(ko)
#=> FSW: Ko is OK
fskp.examine(james)
#=> FST: James is OK
fskp.examine(mary)
#=> CEC: Mary is OK
fskp.examine(robert)
#=> NG