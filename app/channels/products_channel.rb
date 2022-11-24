class ProductsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "products"
  end
end
