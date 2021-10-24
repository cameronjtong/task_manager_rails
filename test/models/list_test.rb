require "test_helper"

class ListTest < ActiveSupport::TestCase
  def setup
    @user = users(:cameron)
    @list = @user.lists.build(name: 'Lorem')
  end

  test "should be valid" do
    assert @list.valid?
  end

  test "list name should be present" do
    @list.name = ""
    assert_not @list.valid?
  end

  test "list name should not be too long" do
    new_name = "a" * 71
    @list.name = new_name
    assert_not @list.valid?
  end
end
