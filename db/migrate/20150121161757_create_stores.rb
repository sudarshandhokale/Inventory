class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.string :name
      t.string :code
      t.references :store_category, index: true
      t.timestamps
    end
  end
end
