# frozen_string_literal: true

FactoryBot.define do
  factory :rent do
    association :user, factory: :user
    association :book, factory: :book
    startDate { '2019-05-07' }
    endDate { '2019-05-07' }
  end
end
