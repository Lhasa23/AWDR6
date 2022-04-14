class StoreController < ApplicationController
  def index
    @products = Product.order(:title)
    flash[:notice] = "We have exactly 1234"
  end

  def show
  end
end
