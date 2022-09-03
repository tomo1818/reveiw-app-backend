class Api::V1::GroupsController < ApplicationController
  before_action :authenticate_api_v1_user!

  def index
    render json: Group.all
  end

  def show
    render json: Group.find(params[:id])
  end

  # def get_categories
  #   render json: Category.where(group_id: params[:id]).to_json();
  # end

  def add_user
    group = Group.find(params[:id])
    group.users << current_api_v1_user
    render json: group.users
  end

  def create
    group = Group.new(group_params)
    group.users << current_api_v1_user
    if group.save
      render json: group
    else
      render json: group.erros, status: 422
    end
  end

  def update
    group = Group.find(params[:id])
    if group.update(group_params)
      render json: group
    else
      render json: group.erros, status: 422
    end
  end

  def destroy
    group = Group.find(params[:id])
    group.destroy
    render json: group
  end

  private
    def group_params
      params.require(:group).permit(:name)
    end

  # def ensure_correct_user
  #   @group = Group.find(params[:id])
  #   unless @group.owner_id == current_user.id
  #     redirect_to groups_path
  #   end
  # end
end