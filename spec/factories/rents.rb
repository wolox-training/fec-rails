# frozen_string_literal: true

FactoryBot.define do
  factory :rent do
    association :user, factory: :user
    association :book, factory: :book
    start_at { '2019-05-07' }
    end_at { '2019-05-07' }
  end
end
