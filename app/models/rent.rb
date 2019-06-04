# frozen_string_literal: true

class Rent < ApplicationRecord
  belongs_to :user, inverse_of: false
  belongs_to :book, inverse_of: false
  validates :user, :book, :start_at, :end_at, presence: true
end
