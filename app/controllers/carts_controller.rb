class CartsController < ApplicationController
  def show
  end

  def destroy
    Cart.find(params[:id]).destroy
    set_cart

    redirect_to cart_url(@cart)
  end
end
