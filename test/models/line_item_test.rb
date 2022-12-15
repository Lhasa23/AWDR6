require "test_helper"

class LineItemTest < ActiveSupport::TestCase

  test "should calculate total price" do
    quantity = 6
    price = 20.00
    line_item = LineItem.new(quantity: quantity, price: price)
    assert_equal(quantity * price, line_item.total_price)
  end

  test 'line item should be synchoronized with product when product is updated' do
    line_item = line_items(:one)
    product = line_item.product
    new_price = product.price - 1

    product.update!(price: new_price)

    line_item.reload
    assert_equal new_price, line_item.price
  end
end
