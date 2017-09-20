class Book
#initialize
attr_reader(:id)
attr_accessor(:name, :author)

def initialize(attributes)
  @id = attributes.fetch(:id)
  @name = attributes.fetch(:name)
  @author = attributes.fetch(:author)
end

#view all books and authors
def self.all
  return_books = DB.exec("SELECT * FROM books;")
  books = []
  return_books.each() do |book|
    id = book.fetch("id").to_i()
    name = book.fetch("name")
    author = book.fetch("author")
    books.push(Book.new({:id => nil, :name => name, :author => author}))
  end
  books
end

#save all books and authors
def save
  result = DB.exec("INSERT INTO books (name, author) VALUES ('#{@name}', '#{@author}') RETURNING id;")
  @id = result.first().fetch("id").to_i
end

#find books

#modify books

#delete books

#view due dates

end
