# == Schema Information
#
# Table name: my_shopping_carts
#
#  id               :integer          not null, primary key
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  product_id       :integer
#  shopping_cart_id :integer
#
# Indexes
#
#  index_my_shopping_carts_on_product_id        (product_id)
#  index_my_shopping_carts_on_shopping_cart_id  (shopping_cart_id)
#

class MyShoppingCart < ApplicationRecord
  belongs_to :product
  belongs_to :shopping_cart
end
