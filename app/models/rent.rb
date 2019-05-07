# frozen_string_literal: true

class Rent < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id', inverse_of: false
  belongs_to :book, foreign_key: 'book_id', inverse_of: false
  validates :user, :book, :startDate, :endDate, presence: true
end
