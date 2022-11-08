class CartsController < ApplicationController
  before_action :check_cart

  def show
  end

  def destroy
    Cart.find(params[:id]).line_items.delete_all

    respond_to do |format|
      format.js
    end
  end

  private

  def check_cart
    unless Cart.exists?(params[:id])
      redirect_to store_index_url, notice: 'Something was wrong, Please try again'
      return
    end
    unless @cart.id.to_s == params[:id]
      redirect_to store_index_url, notice: 'Something was wrong, Please try again'
    end
  end
end