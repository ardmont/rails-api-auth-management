class CreateLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :logs do |t|
      t.string :action, null: false
      t.string :message, null: false

      t.timestamps
    end
  end
end
