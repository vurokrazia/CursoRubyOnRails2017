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

class HasCategory < ApplicationRecord
  belongs_to :product
  belongs_to :category
end
