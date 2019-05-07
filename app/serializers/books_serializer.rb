# frozen_string_literal: true

class BooksSerializer < ActiveModel::Serializer
  attributes :id, :genre, :author, :image, :title, :editorial, :year
end
