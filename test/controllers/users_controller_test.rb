require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get users_url
    assert_response :success
  end

  test "should get new" do
    get new_user_url
    assert_response :success
  end

#START:create
  test "should create user" do
    assert_difference('User.count') do
#START_HIGHLIGHT
      post users_url, params: { user: { name: 'sam',
      password: 'secret', password_confirmation: 'secret' } }
#END_HIGHLIGHT
    end

#START_HIGHLIGHT
    assert_redirected_to users_url
#END_HIGHLIGHT
  end
#END:create

  test "should show user" do
    get user_url(@user)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(@user)
    assert_response :success
  end

#START:update
  test "should update user" do
    patch user_url(@user), params: { user: { name: @user.name,
      password: 'secret', password_confirmation: 'secret' } }
#START_HIGHLIGHT
    assert_redirected_to users_url
#END_HIGHLIGHT
  end
#END:update

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete user_url(@user)
    end

    assert_redirected_to users_url
  end
end
