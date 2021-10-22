require "test_helper"

class ListsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get new_list_path
    assert_response :success
  end
end
