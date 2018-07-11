# == Schema Information
#
# Table name: has_categories
#
#  id          :integer          not null, primary key
#  product_id  :integer
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class HasCategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
