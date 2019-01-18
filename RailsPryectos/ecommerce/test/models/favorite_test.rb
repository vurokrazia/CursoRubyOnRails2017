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

require 'test_helper'

class FavoriteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
