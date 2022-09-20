class LineItemPriceMigrate < ActiveRecord::Migration[6.1]
  def up
    Product.all.each do |product|
      product.line_items.update_all price: product.price
    end
  end

  def down
    LineItem.update_all price: 0.01
  end
end
