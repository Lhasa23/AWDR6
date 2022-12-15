class CartsController < ApplicationController
  before_action :check_cart, only: [:show, :destroy]

  def show
  end

  def destroy
    Cart.find(params[:id]).line_items.delete_all

    respond_to do |format|
      format.js
    end
  end

  def refresh
    @line_item = @cart.line_items.order(:updated_at).last
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