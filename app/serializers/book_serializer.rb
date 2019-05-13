# frozen_string_literal: true

class BookSerializer < ActiveModel::Serializer
  attributes :id, :genre, :author, :image, :title, :editorial, :year
end
