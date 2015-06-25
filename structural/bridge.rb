# Abstraction
class Sorter
  def initialize(sorter)
    @sorter = sorter
  end
  
  def sort
    @sorter.sort
  end
end

# Implementor
class SortImplementor
  def initialize(array)
    @array = array
  end

  def sort
    raise NotImplementedError, "You should implement #{self.class}##{__method__}"
  end
end

# ConcreteImplementor
class QuickSort < SortImplementor
  def sort
    target = @array.pop
    smaller, bigger = @array.partition { |element| element < target }
    @array.push target
    @array = smaller.sort + [target] + bigger.sort
  end
end

# ConcreteImplementor
class BubbleSort < SortImplementor
  def sort
    return @array if (len = @array.length) <= 1
    
    loop do
      swapped = false
      (len - 1).times do |i|
        if @array[i] > @array[i + 1]
          @array[i + 1], @array[i] = @array[i], @array[i + 1]
          swapped = true
        end
      end
      break unless swapped
    end
    @array
  end
end

# RefinedAbstraction
class SortTimer < Sorter
  def print_time
    puts "Start: " + Time.now.strftime("%H:%M:%S")
    print "Sorted: "; p sort
    puts "End: " + Time.now.strftime("%H:%M:%S")
  end
end


############### Usage ###############
quick = SortTimer.new(QuickSort.new([*0..10].shuffle))
quick.print_time
#=> Start: 21:28:55
#=> Sorted: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
#=> End: 21:28:55

bubble = SortTimer.new(BubbleSort.new([*0..10].shuffle))
bubble.print_time
#=> Start: 21:28:55
#=> Sorted: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
#=> End: 21:28:55