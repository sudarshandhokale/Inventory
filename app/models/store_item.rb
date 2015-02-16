class StoreItem < ActiveRecord::Base
  belongs_to :store
  validates :name, :company, :quality, :quantity,
            :price, :store_id, presence: true
  validates :price, numericality: true
  scope :shodh, ->(id) { where(id: id).take }
  scope :collect, ->(id)\
  { [StoreCategory.collection, StoreCategory.store_list(id)] }
end
