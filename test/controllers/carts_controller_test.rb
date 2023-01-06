require "test_helper"

class CartsControllerTest < ActionDispatch::IntegrationTest
  test "should destroy cart" do
    get store_index_url
    cart_id = session[:cart_id]
    delete carts_url, xhr: true

    assert Cart.find(cart_id).line_items.blank?
    assert_select 'tbody tr', 0
  end
end
