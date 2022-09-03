class Api::V1::CategoriesController < ApplicationController

  # 特定のグループに所属するカテゴリーを取得
  def show
    render json: Category.where(group_id: params[:id]).to_json();
  end

  # 特定のカテゴリー1つを取得
  def get_category
    render json: Category.find(params[:category_id]).to_json();
  end

  def create
    category = Category.new(category_params)
    if category.save
      render json: category
    else
      render json: category.erros, status: 422
    end
  end

  def update
    category = Category.find(params[:id])
    group = Group.find(params[:group_id])
    if group.id == category.group_id
      ActiveRecord::Base.transaction do
          if category.update(category_params)
            render json: category.to_json()
          else
            render json: category.errors, status: 422
          end
      end
    else
      render json: { message: 'can not update data' }, status: 422
    end
  end

  def destroy
    category = Category.find(params[:id])
    group = Group.find(params[:group_id])
    if group.id == category.group_id
      category.destroy
      render json: category.to_json()
    else
      render json: { message: 'can not delete data' }, status: 422
    end
  end

  private

    def category_params
      params.require(:category).permit(:name, :group_id)
    end
end
