# == Schema Information
#
# Table name: myimages
#
#  id               :integer          not null, primary key
#  img_file_name    :string
#  img_content_type :string
#  img_file_size    :integer
#  img_updated_at   :datetime
#  title            :string
#  description      :text
#  product_id       :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class MyimageTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
