# == Schema Information
#
# Table name: myimages
#
#  id               :integer          not null, primary key
#  description      :text
#  img_content_type :string
#  img_file_name    :string
#  img_file_size    :integer
#  img_updated_at   :datetime
#  title            :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  product_id       :integer
#
# Indexes
#
#  index_myimages_on_product_id  (product_id)
#

require 'test_helper'

class MyimageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
