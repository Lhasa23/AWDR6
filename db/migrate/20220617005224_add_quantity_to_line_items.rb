class AddQuantityToLineItems < ActiveRecord::Migration[6.1]
  def change
    add_column :line_items, :quantity, :integer
  end
end
