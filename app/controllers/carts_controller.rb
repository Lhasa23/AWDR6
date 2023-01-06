class CartsController < ApplicationController
  def destroy
    @cart.line_items.delete_all

    respond_to do |format|
      format.js
    end
  end

  def refresh
    @line_item = @cart.line_items.order(:updated_at).last
  end
end