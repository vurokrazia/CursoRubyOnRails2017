# == Schema Information
#
# Table name: my_payments
#
#  id                  :integer          not null, primary key
#  email               :string
#  ip                  :string
#  price               :decimal(, )
#  status              :string
#  total               :decimal(, )
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  my_shopping_cart_id :integer
#  paypal_id           :string
#
# Indexes
#
#  index_my_payments_on_my_shopping_cart_id  (my_shopping_cart_id)
#

class MyPayment < ApplicationRecord
  belongs_to :my_shopping_cart
end
