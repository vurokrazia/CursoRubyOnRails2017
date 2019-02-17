# == Schema Information
#
# Table name: my_payments
#
#  id               :integer          not null, primary key
#  email            :string
#  ip               :string
#  price            :string
#  status           :string
#  total            :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  paypal_id        :string
#  shopping_cart_id :integer
#
# Indexes
#
#  index_my_payments_on_shopping_cart_id  (shopping_cart_id)
#

require 'test_helper'

class MyPaymentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
