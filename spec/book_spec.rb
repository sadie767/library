require("rspec")
require("pg")
require("book")

DB = PG.connect({:dbname => 'library_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM books *;")
  end
end

describe(Book) do
  describe('.all') do
    it('is an array that is empty at first') do
      expect(Book.all()).to(eq([]))
    end
  end

  describe('#save') do
    it('adds a book to the array of saved books') do
      save_book = Book.new({:id => nil, :name => 'Dorian Grey', :author => 'Oscar Wilde'})
      save_book.save()
      expect(Book.all()).to(eq([save_book]))
    end
  end

end
