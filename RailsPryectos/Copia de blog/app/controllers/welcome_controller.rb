class WelcomeController < ApplicationController
	def index
		@articulos = Article.all
	end
	def contacto
		@contact = Contact.new
	end
end