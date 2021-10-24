require "test_helper"

class UserLoginTest < ActionDispatch::IntegrationTest
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
  end
end
