json.key_format! camelize: :lower
json.extract! book, :id, :title, :author, :price, :page_count, :about, :binding, :status, :genre, :created_at, :updated_at
json.status_text book.status_text
json.url book_url(book, format: :json)
json.images do
  json.array! book.images do |image|
    json.url image_url(image, format: :json)
    json.extract! image, :image
  end

end
json.user book.user