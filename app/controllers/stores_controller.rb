class StoresController < ApplicationController
  before_action :set_store, only: [:show, :edit, :update, :destroy, :store]
  before_action :set_store_category
  before_action :set_store_list, only: [:index, :create, :update, :stores]

  def index
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)
    if @store.save
      redirect_to stores_path, notice: t('store_create')
    else
      render 'index'
    end
  end

  def update
    if @store.update(store_params)
      redirect_to stores_path, notice: t('store_update')
    else
      render 'index'
    end
  end

  def destroy
    @store.destroy
    redirect_to stores_path, notice: t('store_delete')
  end

  def stores
    render 'stores', layout: false
  end

  def store
    render 'store', layout: false
  end

  private

  def set_store
    @store ||= Store.shodh(params[:id])
  end

  def set_store_category
    @store_categories ||= StoreCategory.collection
  end

  def set_store_list
    @stores ||= Store.all
  end

  def store_params
    params.require(:store).permit(:name, :code, :store_category_id)
  end
end
