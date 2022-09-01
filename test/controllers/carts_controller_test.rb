require "test_helper"

class CartsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get cart_url(carts(:one))
    assert_response :success
  end

  test "should destroy cart" do
    delete cart_url(carts(:one))
    refute Cart.exists?(carts(:one).id)
  end
end
