class StoreCategoriesController < ApplicationController
  before_action :set_store_category, only: [:show, :edit, :update, :destroy]

  def index
    @store_categories = StoreCategory.all
    @store_category = StoreCategory.new
  end

  def create
    @store_category = StoreCategory.new(store_category_params)
    @store_category.save
    redirect_to store_categories_path
  end

  def update
    @store_category.update(store_category_params)
    redirect_to store_categories_path
  end

  def destroy
    @store_category.destroy
    redirect_to store_categories_path
  end

  private

  def set_store_category
    @store_category = StoreCategory.find(params[:id])
  end

  def store_category_params
    params.require(:store_category).permit(:name, :code)
  end
end
