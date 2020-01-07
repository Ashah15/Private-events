require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest

	def setup
    @user = users(:mike)
  end

 test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { username: "", email: "" } }
    assert_template 'sessions/new'
    assert_not flash.empty?
    get root_path
    assert flash.empty?
  end

  test "login with valid information" do

    get login_path
    post login_path, params: { session: { username: @user.username } }
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)
  end


  test "login with valid information followed by logout" do
    get login_path
    post login_path, params: { session: { username:  @user.username} }
    assert is_logged_in?
    assert_redirected_to @user
    follow_redirect!
    assert_template 'users/show'
    assert_select "a[href=?]", login_path, count: 0
    assert_select "a[href=?]", logout_path
    assert_select "a[href=?]", user_path(@user)
    delete logout_path
    assert_not is_logged_in?
  end

  test "login with remembering" do
    log_in_as(@user, remember_me: '1')
    # assert_not_empty cookies[:remember_token]
  end

  test "login without remembering" do
    # Log in to set the cookie.
    log_in_as(@user, remember_me: '1')
    # Log in again and verify that the cookie is deleted.
    log_in_as(@user, remember_me: '0')
    assert_empty cookies[:remember_token]
  end

end