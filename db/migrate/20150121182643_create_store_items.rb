class CreateStoreItems < ActiveRecord::Migration
  def change
    create_table :store_items do |t|
      t.string :name
      t.string :company
      t.string :quality
      t.integer :quantity
      t.decimal :price
      t.string :currency
      t.references :store, index: true
      t.attachment :image
      t.decimal :dimension
      t.timestamps
    end
  end
end
