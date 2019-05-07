class CreateBooks < ActiveRecord::Migration[5.1]
  def change
    create_table :books do |t|
      t.string :genre, :null => false, :default => Faker::Book.genre
      t.string :author, :null => false, :default => Faker::Book.author
      t.string :image, :null => false, :default =>  Faker::File.file_name('foo/bar', 'baz', 'jpg')
      t.string :title, :null => false, :default =>  Faker::Book.title
      t.string :editorial, :null => false, :default => Faker::Book.publisher
      t.string :year, :null => false, :default => Faker::Date.birthday 

      t.timestamps
    end
  end
end
