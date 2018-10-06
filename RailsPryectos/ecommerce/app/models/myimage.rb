class Myimage < ApplicationRecord
	belongs_to :product
    has_attached_file :img,
        styles: {
            thumb:   { geometry: '500x500>' ,     format: :png, convert_options: " -background silver -gravity center -extent 500x500"},
            medium:  { geometry: '630x315>' ,    format: :png, convert_options: " -background silver -gravity center -extent 630x315"},
            big:     { geometry: '1280x1080>' ,    format: :png, convert_options: " -background silver -gravity center -extent 920x560"},
            }, 
            default_url: "/images/:style/missing.png"
    validates_attachment_content_type :img, content_type: /\Aimage\/.*\z/
end
