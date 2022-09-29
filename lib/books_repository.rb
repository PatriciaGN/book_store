require_relative "book.rb"

class BooksRepository
    def all
        books = []

        sql = "SELECT id, title, author_name FROM books;"
        result_set = DatabaseConnection.exec_params(sql, [])

        result_set.each do |each_book|
            book = Book.new
            book.id = each_book["id"]
            book.title = each_book["title"]
            book.author_name = each_book["author_name"]

            books << book
        end
        return books
    end
end
            