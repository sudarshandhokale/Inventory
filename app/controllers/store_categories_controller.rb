class StoreCategoriesController < ApplicationController
  before_action :set_store_category,
                only: [:show, :edit, :update, :destroy, :store_category]
  before_action :set_category_all,
                only: [:index, :create, :update, :store_categories]

  def index
    @store_category = StoreCategory.new
  end

  def create
    @store_category = StoreCategory.new(store_category_params)
    if @store_category.save
      redirect_to store_categories_path, notice: t('store_category_create')
    else
      render 'index'
    end
  end

  def update
    if @store_category.update(store_category_params)
      redirect_to store_categories_path, notice: t('store_category_update')
    else
      render 'index'
    end
  end

  def destroy
    @store_category.destroy
    redirect_to store_categories_path, notice: t('store_category_delete')
  end

  def store_categories
    render 'store_categories', layout: false
  end

  def store_category
    render 'store_category', layout: false
  end

  private

  def set_store_category
    @store_category ||= StoreCategory.shodh(params[:id])
  end

  def set_category_all
    @store_categories ||= StoreCategory.all
  end

  def store_category_params
    params.require(:store_category).permit(:name, :code)
  end
end
