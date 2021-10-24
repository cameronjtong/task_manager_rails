require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout links not logged in" do
    get root_path
    assert_template "static_pages/home"
    assert_select "title", full_title("Home")
    assert_select "a[href=?]", signup_path
    assert_select "a[href=?]", login_path
    assert_select "a[href=?]", root_url
  end
end
