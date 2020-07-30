class CreateAuthors < ActiveRecord::Migration[6.0]
  def change
    create_table :authors do |t|
      t.string :first_name, limit: 35, null: false
      t.string :last_name, limit: 35, null: false

      t.timestamps
    end
  end
end
