class CreateStoreItems < ActiveRecord::Migration
  def change
    create_table :store_items do |t|
      t.string :name
      t.references :store_type, index: true
      t.references :store, index: true
      t.references :store_category, index: true
      t.decimal :price
      t.integer :quantity
      t.decimal :tax

      t.timestamps
    end
  end
end
