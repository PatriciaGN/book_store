require_relative "lib/database_connection"
require_relative "lib/books_repository"

DatabaseConnection.connect("book_store")

books_repository = BooksRepository.new

sql = 'SELECT id, title, author_name FROM books;'
result = DatabaseConnection.exec_params(sql, [])

books_repository.all.each do |each_book|
    puts "#{each_book.id} - #{each_book.title} - #{each_book.author_name}" 
end