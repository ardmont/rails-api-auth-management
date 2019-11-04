class CreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :roles do |t|
      t.string :type
      t.number :level

      t.timestamps
    end
  end
end
