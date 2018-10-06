class Article < ApplicationRecord
    include PermissionsConcern
    has_many :comments, :dependent => :destroy
    has_many :has_categories, :dependent => :destroy
    has_many :categories, through: :has_categories , :dependent => :destroy
	after_create :save_categories
	belongs_to :user
	validates :title, uniqueness: true
	validates :title, :body, presence: true
	validates :title, length: { minimum: 10 }
	validates :body, length: { minimum: 100, too_short: "Minimo son %{count} carácteres." }
	validate :valide_categories
	scope :ultimos, -> {order("created_at DESC")}
	scope :ult, -> {where(title: "Prueba de registro 111")}
	#scope :my_scope, -> (query) {  }
	scope :titulo, -> (title) { where("title LIKE ?", "%#{title}%") }
	#scope :titulo, -> (find_titulo) { where title: find_titulo }
  	#validates :article_id, :category_id, presence: true
  	has_attached_file :img_art,
  		styles: {
  			#thumb:   { geometry: '320x240>',     format: :png, convert_options: " -background white -gravity center -extent 320x240"}, #80x60
  			medium:  { geometry:  "300x300>",    format: :png, convert_options: " -background white -gravity center -extent 300x300"},
  			big: 	 { geometry:  "500x500>",    format: :png, convert_options: " -background white -gravity center -extent 500x500"},
  			ban:     { geometry: '630x315>' ,    format: :png, convert_options: " -background white -gravity center -extent 630x315"},
  			hd: 	 { geometry: '920x560>' ,    format: :png, convert_options: " -background '#C2FE34' -gravity center -extent 920x560"},
  			#hd:      { geometry: '1920x1680>',   format: :png, convert_options: " -background white -gravity center -extent 1920x1680"}
  			}, 
  			default_url: "/images/:style/missing.png"
  	validates_attachment_content_type :img_art, content_type: /\Aimage\/.*\z/

	def categories=(value)
		@categories = value
		#raise @categories.to_yaml
	end
	def getCategories
		@categories
	end
	private
	def save_categories
		@categories.each do |category_id|
			#raise "category_id #{category_id} artilce_id #{self.id}"
			HasCategory.create(category_id: category_id, article_id: self.id)
		end
	end
	def valide_categories
		if self.getCategories.blank? && self.id.nil?
			errors.add(:categories,"Debe agregar una categoria.")
		end
	end
end