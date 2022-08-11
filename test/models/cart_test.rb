require "test_helper"

class CartTest < ActiveSupport::TestCase
  test "add_product twice" do
    product = products(:one)
    cart = carts(:one)
    2.times { cart.add_product(product).save }

    line_items = cart.line_items.where(product_id: product.id)
    assert_equal(1, line_items.size)
    assert_equal(2, line_items.first.quantity)
  end

  test "add_product when line_item not exists" do
    product = products(:one)
    cart = carts(:one)
    cart.add_product(product).save

    line_items = cart.line_items.where(product_id: product.id)
    assert_equal(1, line_items.size)
    assert_equal(1, line_items.first.quantity)
  end
end
