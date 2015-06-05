# Item
class Book
  attr_accessor :title

  def initialize(title)
    @title = title
  end
end

# Aggregate
class BookShelf
  def initialize
    @books = Array.new
  end

  def get_book_at(index)
    @books[index]
  end

  def add(book)
    @books << book
  end

  def length
    @books.length
  end

  def iterator
    BookShelfIterator.new(self)
  end
end

# Iterator
class BookShelfIterator
  def initialize(bookshelf)
    @bookshelf = bookshelf
    @index = 0
  end

  def get_book
    book = @bookshelf.get_book_at(@index) if self.has_next?
    @index += 1
    book
  end

  def has_next?
    @index < @bookshelf.length
  end
end


############## Usage ##############
book_shelf = BookShelf.new
book_shelf.add(Book.new("The Ruby Programming Language"))
book_shelf.add(Book.new("The Ruby Way"))

iterator = book_shelf.iterator

while book = iterator.get_book
  puts book.title
end
#=> The Ruby Programming Language
#=> The Ruby Way