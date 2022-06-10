class ApplicationController < ActionController::Base
  include CurrentCart
  before_action :set_cart
end
