class LineItem < ApplicationRecord
  belongs_to :product
  belongs_to :cart

  def total_price
    quantity * price
  end

  def sync_product!
    self.price = product.price
    save!
  end
end
