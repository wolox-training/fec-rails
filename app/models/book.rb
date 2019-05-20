# frozen_string_literal: true

class Book < ApplicationRecord
  validates :genre, :author, :image, :title, :editorial, :year, presence: true
end
