class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :configuraciones
  before_action :set_shopping_cart

  def configure_permitted_parameters
    #devise_parameter_sanitizer.permit(:sign_up, keys: [:email,:password, :password_confirmation, :name, :last_name, :age, :state, :city, :street])
    devise_parameter_sanitizer.permit(:sign_up) do |user_params|
    	user_params.permit(:email,:password, :password_confirmation, :name, :last_name, :age, :state, :city, :street)
  	end
    devise_parameter_sanitizer.permit(:account_update, keys: [:email,:password, :password_confirmation, :name, :last_name, :age, :state, :city, :street])
  end
  rescue_from CanCan::AccessDenied do |exception|
    if user_signed_in? 
      redirect_to root_path, alert: exception.message
    else
  	 redirect_to new_user_session_path, alert: exception.message
    end
  end
  def configuraciones
  	@categories = Category.all
  end
  private
  def set_shopping_cart
    if cookies[:shopping_cart_id].blank?
      @shopping_cart = ShoppingCart.create!(ip: request.remote_ip)
      cookies[:shopping_cart_id] = @shopping_cart.id
    else
      @shopping_cart = ShoppingCart.find(cookies[:shopping_cart_id])
    end
    rescue ActiveRecord::RecordNotFound => e
      @shopping_cart = ShoppingCart.create!(ip: request.remote_ip)
      cookies[:shopping_cart_id] = @shopping_cart.id
  end
end