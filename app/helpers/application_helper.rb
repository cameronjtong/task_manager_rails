module ApplicationHelper
  def full_title(base_title = nil)
    if base_title
      "#{base_title} | Task Manager"
    else
      "Task Manager"
    end
  end
end
