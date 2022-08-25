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
  end

  test "should update line_item" do
    patch line_item_url(@line_item), params: { line_item: { product_id: @line_item.product_id } }
    assert_redirected_to line_item_url(@line_item)
  end

  test "should destroy line_item" do
    assert_difference('LineItem.count', -1) do
      delete line_item_url(@line_item)
    end

    assert_redirected_to line_items_url
  end

  test "add line item twice" do
    product = products(:one)
    post line_items_url, params: { line_item: { product_id: product.id } }
    post line_items_url, params: { line_item: { product_id: product.id } }

    assert_equal(2, LineItem.last.quantity)
  end

  test "should update line item quantity" do
    line_item = line_items(:one)
    new_quantity = line_item.quantity + 1
    put line_item_url(line_item), params: { line_item: { quantity: new_quantity } }
    assert_equal(new_quantity, line_item.reload.quantity)
  end
end
