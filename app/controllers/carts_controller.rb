class CartsController < ApplicationController
  before_action :set_current_cart, only: [:show, :destroy]
  def show
    @line_items = @cart.line_items
  end

  def destroy
    @cart.line_items.delete_all
    @line_items = @cart.line_items

    respond_to do |format|
      format.js
    end
  end

  private

  def set_current_cart
    @cart = Cart.find(params[:id])
  end
end
