require "test_helper"

class CartsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get store_index_url
    get cart_url(session[:cart_id])
    assert_response :success
  end

  test "should not exists cart" do
    get cart_url('xxx')
    assert_redirected_to store_index_url
    assert_equal 'invalid cart', flash[:notice]
  end

  test "should access cart in session" do
    get cart_url(carts(:one))
    assert_redirected_to store_index_url
    assert_equal 'invalid cart', flash[:notice]
  end

  test "should destroy cart" do
    delete cart_url(carts(:one))
    refute Cart.exists?(carts(:one).id)

    assert_redirected_to cart_url(session[:cart_id])
  end
end
