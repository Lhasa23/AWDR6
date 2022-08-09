class Cart < ApplicationRecord
  has_many :line_items, dependent: :destroy

  def add_product(product)
    line_item = LineItem.find_by(cart_id: id, product_id: product.id)
    if line_item.nil?
      line_item = line_items.build(product: product)
    else
      line_item.quantity += 1
    end
    line_item
  end
end

