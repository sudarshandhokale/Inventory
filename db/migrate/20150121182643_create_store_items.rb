class CreateStoreItems < ActiveRecord::Migration
  def change
    create_table :store_items do |t|
      t.string :name
      t.string :company
      t.string :quality
      t.integer :quantity
      t.decimal :price
      t.references :store, index: true
      t.timestamps
    end
  end
end
