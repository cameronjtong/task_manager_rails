require "test_helper"

class TaskTest < ActiveSupport::TestCase
  def setup
    @list = lists(:grocery)
    @task = @list.tasks.build(content: 'Folgers coffee')
  end

  test "should be valid" do
    assert @task.valid?
  end

  test "should not be valid" do
    @task.list_id = nil
    assert_not @task.valid?
  end

  test "task cannot be empty" do
    @task.content = ''
    assert_not @task.valid?
  end

end
