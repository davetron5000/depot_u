require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
#START_HIGHLIGHT
    get admin_url
#END_HIGHLIGHT
    assert_response :success
  end

end
