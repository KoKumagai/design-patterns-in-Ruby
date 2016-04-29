# Item
class Book
  attr_accessor :title

  def initialize(title)
    @title = title
  end
end

# Aggregate & Iterator
class BookShelf
  include Enumerable
  def initialize
    @books = Array.new
  end

  def each(&block)  
    @books.each(&block)
  end

  def add(book)
    @books << book
  end
end


############## Usage ##############
book_shelf = BookShelf.new
book1 = Book.new("The Ruby Programming Language")
book2 = Book.new("The Ruby Way")
book3 = Book.new("Learning Python")

book_shelf.add(book1)
book_shelf.add(book2)
book_shelf.add(book3)

puts book_shelf.include? book1
#=> true
puts book_shelf.any? {|book| book.title =~ /Ruby+/}
#=> true
puts book_shelf.all? {|book| book.title =~ /Ruby+/}
#=> false