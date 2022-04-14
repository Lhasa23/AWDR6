class StoreController < ApplicationController
  def index
    @products = Product.order(:title)
  end

  def show
  end
end
