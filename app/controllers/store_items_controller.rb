class StoreItemsController < ApplicationController
  before_action :set_store_item,
                only: [:show, :edit, :update, :destroy, :store_item]
  before_action :set_store_item_collect, except: :store
  before_action :set_item_list, only: [:index, :create, :update, :store_items]

  def index
    @store_item = StoreItem.new
  end

  def create
    @store_item = StoreItem.new(store_item_params)
    if @store_item.save
      redirect_to store_items_path, notice: t('store_item_create')
    else
      render 'index'
    end
  end

  def update
    if @store_item.update(store_item_params)
      redirect_to store_items_path, notice: t('store_item_update')
    else
      render 'index'
    end
  end

  def destroy
    @store_item.destroy
    redirect_to store_items_path, notice: t('store_item_delete')
  end

  def store
    @store ||= StoreItem.collect(params[:id])
  end

  def store_items
    render 'store_items', layout: false
  end

  def store_item
    render 'store_item', layout: false
  end

  private

  def set_store_item
    @store_item ||= StoreItem.shodh(params[:id])
  end

  def set_item_list
    @store_items ||= StoreItem.all
  end

  def set_store_item_collect
    @store ||= StoreItem.collect(nil)
  end

  def store_item_params
    params.require(:store_item).permit(:name, :company, :quality\
      , :store_id, :quantity, :price)
  end
end
