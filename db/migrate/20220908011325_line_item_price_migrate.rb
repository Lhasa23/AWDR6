class LineItemPriceMigrate < ActiveRecord::Migration[6.1]
  def up
    # LineItem.all.each do |line_item|
    #   line_item.price = line_item.product.price
    #   line_item.save!
    # end
    Product.all.each do |product|
      product.line_items.update_all price: product.price
    end

  end

  def down
    LineItem.update_all price: 0.01
  end
end
