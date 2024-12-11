class CreateMoveRequests < ActiveRecord::Migration[8.0]
  def change
    create_table :move_requests do |t|
      t.datetime :date
      t.string :status
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
