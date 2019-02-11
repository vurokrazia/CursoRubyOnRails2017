class FavoritesController < ApplicationController
	def create
		#Agregar a favoritos
		favorite = Favorite.new(product_id: params[:product_id], user_id: current_user.id)
		favorite.set_product(params[:product_id],current_user.id)
		if favorite.save
			product = favorite.product.p_name
			@response = "Guardamos el producto en favoritos '#{product}'"
			render json: {response: @response}
		else
			render json: favorite.errors, status: 400
		end
	end
	def destroy
		favorite = Favorite.find(params[:id])
		product = favorite.product
		response = "#{product.p_name} ha sido eliminado de favoritos '#{product}'"
		favorite.destroy
		render json: {response: response}
	end
end
