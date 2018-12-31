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
			#@response = "No pudimos agregar al carrito, intenta de nuevo"
			#redirect_to products_path(id: params[:product_id]), notice: "No pudimos agregar al carrito, intenta de nuevo"
		end
	end

	def destroy
		#Eliminar de un carrito de compra
		@my_shopping_cart = MyShoppingCart.find(params[:id])
		product = @my_shopping_cart.product
		@my_shopping_cart.destroy
		response = "#{product.p_name} ha sido eliminado"
		count = ShoppingCart.find(cookies[:shopping_cart_id]).my_shopping_carts.count 
		render json: { cart: count , response: response, product: product }
	end
end
