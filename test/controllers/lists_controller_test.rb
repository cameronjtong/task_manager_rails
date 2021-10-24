require "test_helper"

class ListsControllerTest < ActionDispatch::IntegrationTest
  def setup
    log_in_as(users(:cameron))
  end
  test "should get new" do
    get new_list_path
    assert_response :success
  end
end
