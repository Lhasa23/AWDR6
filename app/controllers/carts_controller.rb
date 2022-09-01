class CartsController < ApplicationController
  def show
  end

  def destroy
    Cart.find(params[:id]).destroy
  end
end
