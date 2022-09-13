class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy

  def add_product(product)
    line_item = line_items.find_by(product_id: product.id)
    if line_item
      line_item.quantity += 1
    else
      line_item = line_items.build(product_id: product.id)
    end
    line_item.price = product.price
    line_item
  end
end
