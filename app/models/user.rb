# frozen_string_literal: true

class User < ActiveRecord::Base
  extend Devise::Models
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Include default devise modules. Others available are:
  include DeviseTokenAuth::Concerns::User
end
