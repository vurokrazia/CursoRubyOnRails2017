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

require 'test_helper'

class MyShoppingCartTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
