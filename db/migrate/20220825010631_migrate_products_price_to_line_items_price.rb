class MigrateProductsPriceToLineItemsPrice < ActiveRecord::Migration[6.1]
  def up
    LineItem.all.each do |line_item|
      product = Product.find(line_item.product_id)
      return if product.nil?
      line_item.price = product.price
      line_item.save!
    end
  end

  def down
    LineItem.where("price > 0.01").each do |line_item|
      line_item.price = 0.01
      line_item.save!
    end
  end
end
