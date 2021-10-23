require "test_helper"

class CreateTasksTest < ActionDispatch::IntegrationTest
  def setup
    @list = lists(:grocery)
    @task = tasks(:clean)
  end

test "valid task creation" do
  get list_path(@list)
  post tasks_path, params: {
                  id: @list.id,
                   task: {
                    content: 'Folgers Coffee'
                   }
  }
  assert_redirected_to @list
  follow_redirect!
  assert_match 'Folgers Coffee', response.body
end

test "valid task deletion" do
  delete task_path(@task)
  assert_redirected_to @list
  end
end
