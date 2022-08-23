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
    begin
      @current_cart = Cart.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      @current_cart = nil
    end

    if @current_cart.nil? || @current_cart.id != @cart.id
      respond_to do |format|
        format.html { redirect_to store_index_url, notice: "Something was wrong, Please try again" }
      end
    end
  end
end
