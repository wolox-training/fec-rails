class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.integer :password
      t.integer :password_confirmation
      t.string :first_name
      t.string :last_name

      t.timestamps
    end
  end
end
