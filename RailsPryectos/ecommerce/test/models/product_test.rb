# == Schema Information
#
# Table name: products
#
#  id            :integer          not null, primary key
#  p_available   :boolean
#  p_description :text
#  p_name        :string
#  p_price       :float
#  p_quantify    :integer
#  p_send        :float
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  user_id       :integer
#
# Indexes
#
#  index_products_on_user_id  (user_id)
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
