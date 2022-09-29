require_relative "../lib/books_repository"

RSpec.describe BooksRepository do
    def reset_books_table
      seed_sql = File.read('spec/seeds_books.sql')
      connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store' })
      connection.exec(seed_sql)
    end
  
  describe BooksRepository do
    before(:each) do 
      reset_books_table
    end

    it 'returns five books' do
        repo = BooksRepository.new
        books = repo.all
        expect(books.length).to eq 5
        expect(books.first.title).to eq "Nineteen Eighty-Four"
        expect(books.first.author_name).to eq "George Orwell"
    end

    it "when there are no books in the DB" do
        repo = BooksRepository.new
        books = repo.all
        expect(books).to eq ([])
    end
  end
end
