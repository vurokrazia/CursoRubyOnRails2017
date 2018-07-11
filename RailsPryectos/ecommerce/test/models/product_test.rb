# == Schema Information
#
# Table name: products
#
#  id            :integer          not null, primary key
#  p_name        :string
#  p_description :text
#  p_price       :float
#  p_quantify    :integer
#  p_send        :float
#  p_available   :boolean
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
