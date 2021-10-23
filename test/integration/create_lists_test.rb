require "test_helper"

class CreateListsTest < ActionDispatch::IntegrationTest
  def setup
    @list = lists(:grocery)
  end
  test "valid list creation" do
    get root_path
    assert_template 'static_pages/home'
    get new_list_path
    assert_template 'lists/new'
    post lists_path, params: {
                     list: {
                      name: 'Shopping List'
                     }
    }
    assert_redirected_to lists_path
    assert_not flash.empty?
    follow_redirect!
    assert_template 'lists/index'
    assert_match 'Shopping List', response.body
  end

  test "invalid list creation" do
     get root_path
    assert_template 'static_pages/home'
    get new_list_path
    assert_template 'lists/new'
    post lists_path, params: {
                     list: {
                      name: ''
                     }
    }
    assert_not flash.empty?
    assert_template 'lists/new'
  end

  test "valid list deletion" do
    get list_path(@list)
    delete list_path(@list)
    assert_redirected_to root_url
    follow_redirect!
    assert_not flash.empty?
  end
end
