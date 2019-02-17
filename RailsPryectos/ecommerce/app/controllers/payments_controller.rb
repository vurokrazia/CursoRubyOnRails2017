class PaymentsController < ApplicationController
	include PayPal::SDK::REST
	def checkout
		@my_payment = MyPayment.find_by(paypal_id: params[:paymentId])
		if @my_payment.nil?
			redirect_to home_car_path
		else
			payment = Payment.find(params[:paymentId])
			if payment.execute(payer_id: params[:PayerID])
				@my_payment.pay!
				cookies[:shopping_cart_id] = nil
				redirect_to root_path,notice:"Se procesó el pago con PayPal"
			else
				redirect_to home_car_path, notice:"Hubo un error al procesar el pago"	
			end
		end
	end
	def create
		paypal_helper = Payment.new({
			:intent =>  "sale",
			:payer =>  {
				:payment_method =>  "paypal" },
			:redirect_urls => {
				:return_url => checkout_url,
				:cancel_url => home_car_url },
			:transactions =>  [{
				:item_list => {
					:items => 
					@shopping_cart.items
				},
				:amount =>  {
					:total =>  (@shopping_cart.total/100),
					:currency =>  "USD" },
				:description =>  "Pago de paypal" }]}
		)
		if paypal_helper.create
			@payment = MyPayment.create!(
				paypal_id: paypal_helper.id, 
				ip: request.remote_ip,
				shopping_cart_id: cookies[:shopping_cart_id]
			)
			redirect_to paypal_helper.links.find{|v| v.method == "REDIRECT"}.href
		else
			raise paypal_helper.error.to_yaml
		end
  end
end
