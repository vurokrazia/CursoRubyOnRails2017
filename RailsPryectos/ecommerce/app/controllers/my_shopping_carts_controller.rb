class MyShoppingCartsController < ApplicationController
	def create
		#Agregar a un carrito de compra
		@my_shopping_cart = MyShoppingCart.new(product_id: params[:product_id],shopping_cart: @shopping_cart)
		@my_shopping_cart.set_cart_data(@shopping_cart.id,params[:product_id])
		if @my_shopping_cart.save
			@response = "Guardamos el producto en tu carrito"
			count = ShoppingCart.find(cookies[:shopping_cart_id]).my_shopping_carts.count 
			render json: { cart: count , response: @response }
		else
			render json: @my_shopping_cart.errors, status: 400
		end
	end
	def destroy
		#Eliminar de un carrito de compra
		@shopping_cart = ShoppingCart.find_by(id:params[:cart_id])
		#raise @shopping_cart.my_shopping_carts.where(product_id:params[:id]).first.to_json
		@my_shopping_cart = @shopping_cart.my_shopping_carts.where(product_id:params[:id])
		product = @my_shopping_cart.first.product
		@my_shopping_cart.first.destroy
		response = "#{product.p_name} ha sido eliminado"
		count = ShoppingCart.find(cookies[:shopping_cart_id]).my_shopping_carts.count
		render json: { cart: count , response: response, product: product, update_cart: @my_shopping_cart.count }
	end
end
