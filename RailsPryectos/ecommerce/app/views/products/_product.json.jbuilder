json.extract! product, :id, :p_name, :p_description, :p_price, :p_quantify, :p_send, :p_available, :user_id, :created_at, :updated_at
json.url product_url(product, format: :json)
