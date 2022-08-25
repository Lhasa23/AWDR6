require "test_helper"

class CartsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cart = carts(:one)
  end
  test "should get show" do
    get store_index_url
    get cart_url(session[:cart_id])
    assert_response :success
  end

  test "should clear all line items by destroy action" do
    get store_index_url
    cart = Cart.find(session[:cart_id])
    delete cart_url(cart), xhr: true
    assert_equal(0, cart.line_items.size)

    # assert cart.line_items.blank? # will make github action test fail
  end

  test "should cart do not exist" do
    get cart_url(0)
    assert_redirected_to store_index_url
  end

  test "should cart not belongs to the owner" do
    # cart id id wrong
    get cart_url(carts(:two))
    assert_redirected_to store_index_url
  end
end
