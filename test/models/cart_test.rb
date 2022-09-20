require "test_helper"

class CartTest < ActiveSupport::TestCase
  test "should add product when line item not exists" do
    line_item = carts(:one).add_product(products(:ruby))

    assert_equal(line_item.product.price, line_item.price)
    assert_equal(1, line_item.quantity)
  end

  test "should add product when line item exists" do
    line_item = carts(:one).line_items.last
    new_line_item = carts(:one).add_product(line_item.product)

    assert_equal(line_item.quantity + 1, new_line_item.quantity)
    assert_equal(new_line_item.product.price, new_line_item.price)
  end
end
