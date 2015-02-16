class Store < ActiveRecord::Base
  belongs_to :store_category
  has_many :store_items
  validates :name, :code, :store_category_id, presence: true
  validates :code, uniqueness: true
  scope :collection, -> { all.collect { |c| [c.name, c.id] } }
  scope :shodh, ->(id) { where(id: id).take }
  scope :all_count, ->\
  { [StoreCategory.all.count, Store.all.count, StoreItem.all.count] }
end
