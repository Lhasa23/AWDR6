class LineItemQuantityMerge < ActiveRecord::Migration[6.1]
  def up
    Cart.all.each do |cart|
      products_quantity = cart.line_items.group(:product_id).sum(:quantity)
      products_quantity.each do |product_id, products_quantity|
        if quantity > 1
        end
      end
    end
  end

  def down
  end
end
