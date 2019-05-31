class BookSuggestion < ApplicationRecord
  validates :author, :title, :link, :editorial, :year, presence:true
  belongs_to :user, optional: true
end
