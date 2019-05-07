class CreateRents < ActiveRecord::Migration[5.1]
  def change
    create_table :rents do |t|
      t.belongs_to :user
      t.belongs_to :book
      t.date :start_at
      t.date :end_at

      t.timestamps
    end
  end
end
