class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.string :item
      t.float :price
      t.string :discription
      t.integer :order_id
      t.string :image
      t.integer :quantity
      t.integer :cart_id
      t.integer :brand_id
      t.timestamps
    end
  end
end
