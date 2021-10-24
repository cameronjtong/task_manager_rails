require "test_helper"

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select 'title', full_title('Home')
    assert_select 'a[href=?]', new_list_path
    assert_select 'a[href=?]', lists_path
    assert_select 'a[href=?]', root_url
  end
end
