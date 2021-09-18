class DropUsers < ActiveRecord::Migration[6.1]
  def change
    drop_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password
      t.string :role
      t.timestamps null: false
    end
  end
end
