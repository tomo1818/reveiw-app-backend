class Api::V1::UsersController < ApplicationController
  def index
    render json: User.all
  end

  def show
    render json: UserGroup.where(user_id: params[:id]).to_json()
  end
end
