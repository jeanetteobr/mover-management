class CreateInventoryItems < ActiveRecord::Migration[8.0]
  def change
    create_table :inventory_items do |t|
      t.string :name
      t.integer :quantity
      t.references :move_request, null: false, foreign_key: true

      t.timestamps
    end
  end
end
