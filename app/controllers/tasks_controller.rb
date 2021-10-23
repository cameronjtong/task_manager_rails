class TasksController < ApplicationController
  def create
    @list = List.find(params[:id])
    @list.tasks.create!(task_params)
      flash[:success] = 'Task added!'
      redirect_to @list
    end

    private

    def task_params
      params.require(:task).permit(:content)
    end
  end
