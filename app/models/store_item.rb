class StoreItem < ActiveRecord::Base
  belongs_to :store_type
  belongs_to :store
  belongs_to :store_category
  scope :collection, -> \
  { [StoreType.collection, Store.collection, StoreCategory.collection] }

  def store_type_name
    store_type ? store_type.name : '-'
  end

  def store_name
    store ? store.name : '-'
  end

  def store_category_name
    store_category ? store_category.name : '-'
  end
end
