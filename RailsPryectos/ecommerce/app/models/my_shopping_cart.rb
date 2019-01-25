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
  validate :validate_units
  def set_cart_data (cart,product_id)
    @ip = cart
    @id = product_id 
  end
  def validate_units
    product = Product.find(@id)
    my_shopping_cart = ShoppingCart.find(@ip).products.where(id:@id)
    #raise (product.p_quantify > in_cart.count).to_json
		if product.p_quantify < my_shopping_cart.count
			errors.add(:products, "Ah registrado todas las unidades disponibles")
		end
  end
end
