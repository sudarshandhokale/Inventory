class StoreCategory < ActiveRecord::Base
  scope :collection, -> { all.collect { |c| [c.name, c.id] } }
end
