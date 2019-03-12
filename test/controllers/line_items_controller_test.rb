require 'test_helper'

class LineItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @line_item = line_items(:one)
  end

  test "should get index" do
    get line_items_url
    assert_response :success
  end

  test "should get new" do
    get new_line_item_url
    assert_response :success
  end

#START:create
  test "should create line_item" do
    assert_difference('LineItem.count') do
      post line_items_url, params: { product_id: products(:ruby).id }
    end

    follow_redirect!

#START_HIGHLIGHT
    assert_select 'h2', 'Your Cart'
#END_HIGHLIGHT
#START_HIGHLIGHT
#START_HIGHLIGHT
    assert_select 'td', "Programming Ruby 1.9"
#END_HIGHLIGHT
#END_HIGHLIGHT
  end
#END:create

  test "should show line_item" do
    get line_item_url(@line_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_line_item_url(@line_item)
    assert_response :success
  end

#START:update
  test "should update line_item" do
#START_HIGHLIGHT
    patch line_item_url(@line_item),
      params: { line_item: { product_id: @line_item.product_id } }
#END_HIGHLIGHT
    assert_redirected_to line_item_url(@line_item)
  end
#END:update

  test "should destroy line_item" do
    assert_difference('LineItem.count', -1) do
      delete line_item_url(@line_item)
    end

    assert_redirected_to line_items_url
  end

#START:ajax
  test "should create line_item via ajax" do
    assert_difference('LineItem.count') do
      post line_items_url, params: { product_id: products(:ruby).id },
        xhr: true
    end 

    assert_response :success
    assert_match /<tr class=\\"line-item-highlight/, @response.body
  end
#END:ajax
end
