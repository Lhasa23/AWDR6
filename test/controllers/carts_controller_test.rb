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
    assert_equal 'Something was wrong, Please try again', flash[:notice]
  end

  test "should access cart in session" do
    get cart_url(carts(:one))
    assert_redirected_to store_index_url
    assert_equal 'Something was wrong, Please try again', flash[:notice]
  end

  test "should destroy cart" do
    get store_index_url
    cart_id = session[:cart_id]
    delete cart_url(cart_id), xhr: true

    assert Cart.find(cart_id).line_items.blank?
    assert_select 'tbody tr', 0
  end
end
