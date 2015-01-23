class StoreItemsController < ApplicationController
  before_action :set_store_item, only: [:show, :edit, :update, :destroy]

  def index
    @store_items = StoreItem.all
    @store_item = StoreItem.new
    @store = StoreItem.collection
  end

  def create
    @store_item = StoreItem.new(store_item_params)
    @store_item.save
    redirect_to store_items_path
  end

  def edit
    @store = StoreItem.collection
  end

  def update
    @store_item.update(store_item_params)
    redirect_to store_items_path
  end

  def destroy
    @store_item.destroy
    redirect_to store_items_path
  end

  private

  def set_store_item
    @store_item = StoreItem.find(params[:id])
  end

  def store_item_params
    params.require(:store_item).permit(:name, :store_type_id\
      , :store_id, :store_category_id, :price, :quantity, :tax)
  end
end
