class BookParser
  def self.get_books
    response = Faraday.get("https://jsonplaceholder.typicode.com/users")
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.book_feed
    get_books.map do |book|
      Book.create(
        isbn: book[:address][:zip_code].to_i,
        title: book[:username],
        author: book[:name],
        category: book[:company][:name],
        type: "PhysicalBook"
      )
    end
  end
end