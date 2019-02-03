# == Schema Information
#
# Table name: shopping_carts
#
#  id         :integer          not null, primary key
#  ip         :string
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ShoppingCart < ApplicationRecord
  include AASM
  has_many :my_shopping_carts, :dependent => :destroy
  has_many :products, through: :my_shopping_carts
  aasm column: "status" do 
    state :created, initial: true
    state :payed
    event :pay do
      transitions from: :created, to: :payed
    end
  end
end

