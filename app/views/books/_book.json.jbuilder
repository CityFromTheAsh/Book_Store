json.extract! book, :id, :title, :author, :price, :page_count, :about, :owner, :date_of_realize, :binding, :genre, :book_for_sell, :created_at, :updated_at
json.url book_url(book, format: :json)