json.extract! account, :id, :login, :product, :price, :about, :buy_sell, :created_at, :updated_at
json.url account_url(account, format: :json)