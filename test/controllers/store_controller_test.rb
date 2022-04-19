require "test_helper"

class StoreControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get store_index_url
    assert_response :success
    assert_select 'nav.side_nav ul li', 4
    assert_select 'ul.catalog li', minimum: 3
    assert_select 'ul.catalog li h2', 'MyString1'
    assert_select 'ul.catalog li .price', /^\$[,\d]+\.\d{2}$/
  end
end
