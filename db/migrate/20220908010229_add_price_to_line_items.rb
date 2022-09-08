class AddPriceToLineItems < ActiveRecord::Migration[6.1]
  def change
    add_column :line_items, :price, :decimal, default: 0.01
  end
end
