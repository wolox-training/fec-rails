# frozen_string_literal: true

class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true

  devise :database_authenticatable, :registerable
  has_many :rents, dependent: :restrict_with_exception
  has_many :book_suggestions, dependent: :restrict_with_exception
  include DeviseTokenAuth::Concerns::User
end
