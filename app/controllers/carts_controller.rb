class CartsController < ApplicationController
  before_action :set_current_cart, only: [:show, :destroy]
  def show
    @line_items = @current_cart.line_items
  end

  def destroy
    @current_cart.line_items.delete_all
    @line_items = @current_cart.line_items

    respond_to do |format|
      format.js
    end
  end

  private

  def set_current_cart
    @current_cart = Cart.find(params[:id])
  end
end
