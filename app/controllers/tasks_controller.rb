class TasksController < ApplicationController
  before_action :logged_in_user
  def create
    @list = List.find(params[:id])
    @list.tasks.create!(task_params)
    flash[:success] = "Task added!"
    redirect_to @list
  end

  def destroy
    task = Task.find(params[:id])
    list = task.list
    task.destroy
    redirect_to list
  end

  private

  def task_params
    params.require(:task).permit(:content)
  end
end
