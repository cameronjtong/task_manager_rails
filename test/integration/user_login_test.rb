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
end
