class LineItemQuantityMerge < ActiveRecord::Migration[6.1]
  def up
    Cart.all.each do |cart|
      products_quantity = cart.line_items.group(:product_id).sum(:quantity)
      products_quantity.each do |product_id, quantity|
        if quantity > 1
          cart.line_items.where(product_id: product_id).delete_all
          LineItem.create(product_id: product_id, quantity: quantity, cart_id: cart.id)
        end
      end
    end
  end

  def down
  end
end
