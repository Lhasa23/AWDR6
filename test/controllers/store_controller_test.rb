require "test_helper"

class StoreControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get store_index_url
    assert_response :success

    assert_select 'nav.side_nav a', minimum: 4
    assert_select 'main ul.catalog li', 3
    assert_select 'h2', 'Programing Ruby 1.9'
    assert_select '.price', /^((CNY￥)|\$)\s?[,\d]+\.\d{2}/
  end

  test "should display access count" do
    6.times {
      get store_index_url
    }

    assert_select '.access-count', '6 times'
  end

  test "should not display when visit times less than 6" do
    get store_index_url
    get store_index_url

    assert_select '.access-count', 0
  end


end

