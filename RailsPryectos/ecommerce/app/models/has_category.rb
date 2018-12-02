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
  belongs_to :product, :dependent => :destroy
  belongs_to :category, :dependent => :destroy
end
