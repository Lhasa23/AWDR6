class StoreController < ApplicationController
  include AccessControl

  def index
    access_counter
    @products = Product.order(:title)
  end
end
