class Contact < ApplicationRecord
	validates :email,:title,:description, presence: true
	validates :title, length: { minimum: 20, too_short: "Minimo son %{count} carácteres." }
	validates :description, length: { minimum: 50, too_short: "Minimo son %{count} carácteres." }
end