class CreateItemSplits < ActiveRecord::Migration
  def change
    create_table :item_splits do |t|
      t.integer :item_id
      t.integer :person_id

      t.timestamps null: false
    end
  end
end
