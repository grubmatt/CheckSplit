class CreateOrderItems < ActiveRecord::Migration
  def change
    create_table :order_items do |t|
      t.integer :order_id
      t.string :description
      t.integer :cost

      t.timestamps null: false
    end
  end
end
