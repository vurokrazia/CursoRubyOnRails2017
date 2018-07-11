# == Schema Information
#
# Table name: categories
#
#  id                 :integer          not null, primary key
#  name               :string
#  description        :string
#  c_img_file_name    :string
#  c_img_content_type :string
#  c_img_file_size    :integer
#  c_img_updated_at   :datetime
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'test_helper'

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
