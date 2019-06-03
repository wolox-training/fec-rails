class CreateRents < ActiveRecord::Migration[5.1]
  def change
    create_table :rents do |t|
      t.belongs_to :user, :null => false
      t.belongs_to :book, :null => false
      t.date :start_at, :null => false
      t.date :end_at, :null => false

      t.timestamps
    end
  end
end
