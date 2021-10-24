require "test_helper"

class UserSignupTest < ActionDispatch::IntegrationTest
  test "valid signup" do
    get signup_path
    post users_path,
         params: {
           user: {
             name: "Cameron",
             email: "cameron.tong2b@gmail.com",
             password: "foobar",
             password_confirmation: "foobar",
           },
         }
    assert_redirected_to root_url
    assert_not flash.empty?
  end

  test "invalid signup" do
    get signup_path
    post users_path,
         params: {
           user: {
             name: "Cameron",
             email: "cameron.tong2b@gmail",
             password: "foo",
             password_confirmation: "foo",
           },
         }
    assert_template "users/new"
  end
end
