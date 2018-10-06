#json.arra! @articulos, partial: "articles/article", as: :article
json.array! @articulos do |art|  json.(art, :id, :title, :body, :categories, :user) end	