# == Schema Information
#
# Table name: products
#
#  id            :integer          not null, primary key
#  p_name        :string
#  p_description :text
#  p_price       :float
#  p_quantify    :integer
#  p_send        :float
#  p_available   :boolean
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Product < ApplicationRecord
  belongs_to :user
  has_many :myimages, :dependent => :destroy
  has_many :has_categories, :dependent => :destroy
  has_many :categories, through: :has_categories, :dependent => :destroy
  after_create :save_categories
  validate :valide_categories

  #Validates
  validates :p_name, presence: true, length: {minimum: 10, too_short: "Minimo son %{count} caracteres." }
  validates :p_description, presence: true, length: {minimum: 50, too_short: "Minimo son %{count} caracteres." }
  validates :p_price, presence: true, :numericality => true
  validates :p_send, presence: true, :numericality => true

  def categories=(value)
  	@categories = value
  end
  def getCategories
		@categories
  end  

  private
  def save_categories
  	@categories.each do |category_id|
  		HasCategory.create(category_id: category_id, product_id: self.id)
  	end
  end
  def valide_categories
  	if self.getCategories.blank? && self.id.nil?
  		errors.add(:categories, "Debe agregar una categoria.")
  	end
  end
end
