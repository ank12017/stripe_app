class CreateOrderItems < ActiveRecord::Migration[5.1]
  def change
    create_table :order_items do |t|
      t.string :name
      t.references :product, foreign_key: true
      t.references :order, foreign_key: true
      t.integer :quantity
      t.float :total
      t.timestamps
    end
  end
end
