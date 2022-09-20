require "test_helper"

class LineItemTest < ActiveSupport::TestCase

  test "should calculate total price" do
    quantity = 6
    price = 20.00
    line_item = LineItem.new(quantity: quantity, price: price)
    assert_equal(quantity * price, line_item.total_price)
  end
end
