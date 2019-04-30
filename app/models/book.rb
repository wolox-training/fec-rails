class Book < ApplicationRecord
  validates :genre, :presence => true
  validates :author, :presence => true
  validates :image, :presence => true
  validates :title, :presence => true
  validates :editorial, :presence => true
  validates :year, :presence => true
end
