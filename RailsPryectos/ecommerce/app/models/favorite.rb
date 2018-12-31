# == Schema Information
#
# Table name: favorites
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :integer
#  user_id    :integer
#
# Indexes
#
#  index_favorites_on_product_id  (product_id)
#  index_favorites_on_user_id     (user_id)
#

class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :product
  validate :favorite_uniquess 
  def set_product(product_id, user_id)
    @product = product_id
    @user = user_id
  end
  private
  def favorite_uniquess
    favorite = Favorite.find_by(user_id:@user,product_id:@product)
  	if !favorite.nil?
  		errors.add(:favorites, "Ya esta registrado su producto en favoritos")
  	end
  end
end
