class Category < ApplicationRecord
	has_many :has_categories, :dependent => :destroy
	has_many :articles, through: :has_categories, :dependent => :destroy
	belongs_to :user
	validates :name, :color, presence: true
	validates :name, length: { in: 7..20 }
	validates :color, length: { in: 4..7 }

	has_attached_file :cat_img,
  		styles: {
  			medium:  { geometry:  "300x300>",    format: :png, convert_options: " -background white -gravity center -extent 300x300"}
  			}, 
  			default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :cat_img, content_type: /\Aimage\/.*\z/

end
