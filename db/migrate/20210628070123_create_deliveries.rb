class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.string  :zip_code,         null: false
      t.integer :shipping_area_id, null: false
      t.string  :municipalities,   null: false
      t.string  :address,          null: false
      t.string  :building
      t.string  :tel,              null: false 
      t.references :user_item,      foreign_key: true 

      t.timestamps
    end
  end
end
