class AddIndexes < ActiveRecord::Migration[6.0]
  def change
    add_index :roles, :name, unique: true
    add_index :users, :email, unique: true
  end
end
