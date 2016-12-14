json.extract! book, :id, :title, :author, :price, :page_count, :about, :binding, :genre, :created_at, :updated_at
json.url book_url(book, format: :json)