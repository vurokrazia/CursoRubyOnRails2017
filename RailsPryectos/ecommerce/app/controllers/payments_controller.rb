class PaymentsController < ApplicationController
	include PayPal::SDK::REST
	def checkout
		@my_payment = MyPayment.find_by(paypal_id: params[:paymentId])
		if @my_payment.nil?
			redirect_to "/home/car/"
		else
			payment = Payment.find(params[:paymentId])
			if payment.execute(payer_id: params[:PayerID])
				@my_payment.pay!
				redirect_to root_path,notice:"Se procesó el pago con PayPal"
			else
				redirect_to home_car_path, notice:"Hubo un error al procesar el pago"	
			end
		end
	end

	def process_card
		paypal_helper = Stores::Paypal.new(@shopping_cart.total,
																			@shopping_cart.items,
																			return_url:checkout_url,
																			cancel_url: carrito_url)

		if paypal_helper.process_card(params).create
			@my_payment = MyPayment.create!(paypal_id: paypal_helper.payment.id,
																	ip:request.remote_ip,
																	email: params[:email],
																	shopping_cart_id: cookies[:shopping_cart_id])
			@my_payment.pay!
			redirect_to carrito_path, notice: "El pago se realizó correctamente"
		else
			redirect_to carrito_path, notice: paypal_helper.payment.error
		end
	end

	def create
		puts @shopping_cart.total
		paypal_helper = Payment.new({
			:intent =>  "sale",
			:payer =>  {
				:payment_method =>  "paypal" },
			:redirect_urls => {
				:return_url => "http://localhost:3000/checkout",
				:cancel_url => "http://localhost:3000/home/car" },
			:transactions =>  [{
				:item_list => {
					:items => [{
						:name => "item",
						:sku => "item",
						:price => (@shopping_cart.total/100),
						:currency => "USD",
						:quantity => 1 }
					]},
				:amount =>  {
					:total =>  (@shopping_cart.total/100),
					:currency =>  "USD" },
				:description =>  "Pagoo" }]}
		)
		if paypal_helper.create
			@payment = MyPayment.create!(
				paypal_id: paypal_helper.id, 
				ip: request.remote_ip,
				shopping_cart_id: cookies[:shopping_cart_id]
			)
			redirect_to paypal_helper.links.find{|v| v.method == "REDIRECT"}.href
			#[{href:"jesus@gmail.com",method:"algo"},{method:"REDIRECT",href:"paypal.com"}]
		else
			raise paypal_helper.error.to_yaml
		end
  end
end
