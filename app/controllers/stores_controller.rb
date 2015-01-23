class StoresController < ApplicationController
  before_action :set_store, only: [:show, :edit, :update, :destroy]

  def index
    @stores = Store.all
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)
    @store.save
    redirect_to stores_path
  end

  def update
    @store.update(store_params)
    redirect_to stores_path
  end

  def destroy
    @store.destroy
    redirect_to stores_path
  end

  private

  def set_store
    @store = Store.find(params[:id])
  end

  def store_params
    params.require(:store).permit(:name, :code)
  end
end
