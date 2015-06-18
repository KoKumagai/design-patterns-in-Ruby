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
    len = @array.length
    (len - 1).times do
      (len - 1).times do |i|
        if @array[i] > @array[i + 1]
          @array[i + 1], @array[i] = @array[i], @array[i + 1]
        end
      end
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
quick = SortTimer.new(QuickSort.new([5,2,3,7,1,9,4,10,8,6]))
quick.print_time
#=> Start: 21:28:55
#=> Sorted: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
#=> End: 21:28:55

bubble = SortTimer.new(BubbleSort.new([5,2,3,7,1,9,4,10,8,6]))
bubble.print_time
#=> Start: 21:28:55
#=> Sorted: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
#=> End: 21:28:55