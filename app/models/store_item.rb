class StoreItem < ActiveRecord::Base
  belongs_to :store
  validates :name, :company, :quality, :quantity,
            :price, :store_id, :currency, :dimension, presence: true
  validates :price, :dimension, numericality: true
  has_attached_file :image
  validates_attachment_content_type :image\
  , content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']
  scope :shodh, ->(id) { where(id: id).take }
  scope :collect, ->(id)\
  { [StoreCategory.collection, StoreCategory.store_list(id)] }
end
