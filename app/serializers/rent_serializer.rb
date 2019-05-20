# frozen_string_literal: true

class RentSerializer < ActiveModel::Serializer
  attributes :user, :book, :start_at, :end_at
end
