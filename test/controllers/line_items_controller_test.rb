require "test_helper"

class LineItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @line_item = line_items(:one)
  end

  test "should create line_item" do
    assert_difference('LineItem.count') do
      post line_items_url, params: { line_item: { product_id: @line_item.product_id } }
    end

    assert_redirected_to cart_url(id: session[:cart_id])
    line_item = LineItem.last
    assert_equal(line_item.product.price, line_item.price)
  end

  test "should destroy line_item" do
    assert_difference('LineItem.count', -1) do
      delete line_item_url(@line_item), xhr: true
    end
  end

  test "add line item twice" do
    product = products(:one)
    post line_items_url, params: { line_item: { product_id: product.id } }
    post line_items_url, params: { line_item: { product_id: product.id } }

    line_item = LineItem.last
    assert_equal(2, line_item.quantity)
    assert_equal(line_item.product.price, line_item.price)
  end

  test "should update line item quantity" do
    line_item = line_items(:one)
    new_quantity = line_item.quantity + 1
    put line_item_url(line_item), params: { line_item: { quantity: new_quantity } }, xhr: true

    line_item.reload
    assert_equal(line_item.product.price, line_item.price)
    assert_equal(new_quantity, line_item.quantity)
  end
end
