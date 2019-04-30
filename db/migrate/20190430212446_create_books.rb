class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :genre
      t.string :author
      t.string :image
      t.string :title
      t.string :editorial
      t.sting :year

      t.timestamps
    end
  end
end
