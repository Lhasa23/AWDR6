class CartsController < ApplicationController
  before_action :check_cart

  def show
  end

  def destroy
    Cart.find(params[:id]).destroy
    set_cart

    redirect_to cart_url(@cart)
  end

  private

  def check_cart
    unless Cart.exists?(params[:id])
      redirect_to store_index_url, notice: 'invalid cart'
      return
    end
    unless @cart.id.to_s == params[:id]
      redirect_to store_index_url, notice: 'invalid cart'
    end
  end
end