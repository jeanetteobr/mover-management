class AddUniqueIndexToCustomersEmail < ActiveRecord::Migration[8.0]
  def change
    add_index :customers, :email, unique: true
  end
end