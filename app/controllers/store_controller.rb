class StoreController < ApplicationController
  include AccessCounter
  before_action :access_count

  def index
    @products = Product.order(:title)
  end
end
