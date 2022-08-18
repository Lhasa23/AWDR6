class CartsController < ApplicationController
  def show
    @line_items = Cart.find(params[:id]).line_items
  end
end
