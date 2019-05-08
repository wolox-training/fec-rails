# frozen_string_literal: true

FactoryBot.define do
  factory :rent do
    association :user, factory: :user
    association :book, factory: :book
    start_at { Faker::Date.backward }
    end_at { Faker::Date.forward }
  end
end
