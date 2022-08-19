require "test_helper"

class CartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cart = carts(:one)
  end
  test "should get show" do
    get cart_url(@cart)
    assert_response :success
  end

  test "should clear all line items by destroy action" do
    delete cart_url(@cart), xhr: true

    assert_equal(0, @cart.line_items.size)
  end
end
