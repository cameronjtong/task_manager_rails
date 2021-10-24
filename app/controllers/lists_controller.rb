class ListsController < ApplicationController
  before_action :logged_in_user
  def new
    @list = List.new
  end

  def create
    @list = current_user.lists.build(list_params)
    if @list.save
      flash[:success] = "List created successfully!"
      redirect_to lists_path
    else
      flash.now[:danger] = "Invalid list name"
      render "new"
    end
  end

  def index
    @lists = current_user.lists.all
  end

  def show
    @list = current_user.lists.find_by(id: params[:id])
  end

  def destroy
    List.find(params[:id]).destroy
    flash[:success] = "List successfully deleted!"
    redirect_to root_url
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
