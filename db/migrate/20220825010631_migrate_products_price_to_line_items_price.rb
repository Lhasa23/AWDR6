class MigrateProductsPriceToLineItemsPrice < ActiveRecord::Migration[6.1]
  def up
    LineItem.all.each do |line_item|
      product = Product.find_by(id: line_item.product_id)
      line_item.price = product.price
      line_item.save!
    end
  end

  def down
    LineItem.update_all price: 0.01
  end
end
