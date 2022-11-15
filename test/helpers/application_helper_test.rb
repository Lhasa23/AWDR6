require "test_helper"

class ApplicationHelperTest < ActionView::TestCase
  test "should render when condition is true" do
    html_str = render_if true, line_items(:one), latest_line_item: nil
    assert html_str.present?
  end

  test "should be blank when condition is false" do
    html_str = render_if false, line_items(:one), latest_line_item: nil
    assert html_str.blank?
  end
end
