# frozen_string_literal: true

class User < ActiveRecord::Base
  extend Devise::Models
  validates :first_name, presence: true
  validates :last_name, presence: true
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Include default devise modules. Others available are:
  include DeviseTokenAuth::Concerns::User
end
