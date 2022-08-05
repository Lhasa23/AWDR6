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
    line_items = LineItem.where("quantity > 1")
    line_items.each do |line_item|
      line_item.quantity.times { LineItem.create(product_id: line_item.product_id, quantity: 1, cart_id: line_item.cart_id) }
    end
    line_items.delete_all
  end
end
