class CreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :roles do |t|
      t.string :type
      t.integer :level

      t.timestamps
    end
  end
end
