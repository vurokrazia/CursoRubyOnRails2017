class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:purchases, :favorites, :history]
  def search
    @products = Product.where("p_name LIKE :query", query: "%#{params[:find]}%")
  end
  def index
    @products = Product.paginate(:page => params[:page], :per_page => 24)
  end

  def purchases
    @payments = current_user.my_payments
  end

  def history
  end

  def favorites
    @favorites = current_user.favorites
  end
end
