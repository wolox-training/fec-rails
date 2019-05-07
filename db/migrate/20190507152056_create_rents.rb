class CreateRents < ActiveRecord::Migration[5.1]
  def change
    create_table :rents do |t|
      t.belongs-to :user
      t.belongs_to :book
      t.date :startDate
      t.date :endDate

      t.timestamps
    end
  end
end
