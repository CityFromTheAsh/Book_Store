json.extract! order, :id, :product, :price, :seller, :buyer, :admin, :created_at, :updated_at
json.url order_url(order, format: :json)