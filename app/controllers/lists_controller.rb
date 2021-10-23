class ListsController < ApplicationController
  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      flash[:success] = 'List created successfully!'
      redirect_to lists_path
    else
      flash[:danger] = 'Invalid list name'
      render 'new'
    end
  end

  def index
    @lists = List.all
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
