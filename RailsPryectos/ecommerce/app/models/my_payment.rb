# == Schema Information
#
# Table name: my_payments
#
#  id               :integer          not null, primary key
#  email            :string
#  ip               :string
#  price            :decimal(, )
#  status           :string
#  total            :decimal(, )
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  paypal_id        :string
#  shopping_cart_id :integer
#
# Indexes
#
#  index_my_payments_on_shopping_cart_id  (shopping_cart_id)
#

class MyPayment < ApplicationRecord
  belongs_to :shopping_cart
  has_many :products, through: :shopping_cart
	include AASM

	aasm column: "status" do
		state :created, initial: true
		state :payed
		state :failed
		event :pay do
			after do
				shopping_cart.pay!
			end
			transitions from: :created, to: :payed
		end
	end


	def products_by_user(user)
		self.products.where(products:{user_id:user.id})
	end
end
