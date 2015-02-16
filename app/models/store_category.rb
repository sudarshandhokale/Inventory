class StoreCategory < ActiveRecord::Base
  has_many :stores
  has_many :store_items, through: :stores
  validates :name, :code, presence: true
  validates :code, uniqueness: true
  scope :collection, -> { all.collect { |c| [c.name, c.id] } }
  scope :shodh, ->(id) { where(id: id).take }
  scope :store_list, ->(id) { id ? shodh(id).collect : '' }

  def collect
    stores.collect { |c| [c.name, c.id] }
  end
end
