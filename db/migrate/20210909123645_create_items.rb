class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      
      t.string :item_name, null: false
      t.text :explain, null: false
      t.integer :price, null: false
      t.integer :genre_id, null: false
      t.integer :status_id, null: false
      t.integer :shipping_id, null: false
      t.integer :prefecture_id, null: false
      t.integer :delivery_id, null: false
      t.references :user, null: false
      

      t.timestamps

      
    end
  end
end
