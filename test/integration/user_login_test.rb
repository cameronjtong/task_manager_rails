require "test_helper"

class UserLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:cameron)
  end

  test "invalid login" do
    get login_path
    post login_path,
         params: {
           session: {
             email: "",
             password: "foo",
           },
         }
    assert_template "sessions/new"
    assert_not flash.empty?
  end

  test "valid login" do
    get login_path
    post login_path,
         params: {
           session: {
             email: "cameron@cameron.com",
             password: "foobar",
           },
         }
    assert_redirected_to root_url
    follow_redirect!
    assert_select "a[href=?]", new_list_path
    assert_select "a[href=?]", lists_path
    assert_select "a[href=?]", logout_path
    delete logout_path
    assert_not is_logged_in?
    assert_redirected_to root_url
    delete logout_path
    follow_redirect!
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", logout_path, count: 0
  end

  test "login with remembering" do
    log_in_as(@user)
    assert_not_nil cookies[:remember_token]
  end

  test "login without remembering" do
    log_in_as(@user, remember_me: "0")
    assert_nil cookies[:remember_token]
  end
end
