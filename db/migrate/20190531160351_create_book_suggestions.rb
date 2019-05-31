class CreateBookSuggestions < ActiveRecord::Migration[5.1]
  def change
    create_table :book_suggestions do |t|
      t.string :synopsis
      t.float :price
      t.string :author
      t.string :title
      t.string :link
      t.string :editorial
      t.string :year
      t.belongs_to :user

      t.timestamps
    end
  end
end
