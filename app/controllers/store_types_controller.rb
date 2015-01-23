class StoreTypesController < ApplicationController
  before_action :set_store_type, only: [:show, :edit, :update, :destroy]

  def index
    @store_types = StoreType.all
    @store_type = StoreType.new
  end

  def create
    @store_type = StoreType.new(store_type_params)
    @store_type.save
    redirect_to store_types_path
  end

  def update
    @store_type.update(store_type_params)
    redirect_to store_types_path
  end

  def destroy
    @store_type.destroy
    redirect_to store_types_path
  end

  private

  def set_store_type
    @store_type = StoreType.find(params[:id])
  end

  def store_type_params
    params.require(:store_type).permit(:name, :code)
  end
end
