# frozen_string_literal: true

FactoryBot.define do
  factory :book_suggestion do
    link { Faker::Internet.url }
    author { Faker::Book.author }
    editorial { Faker::Book.publisher }
    year { Faker::Date.backward.year.to_s }
    title { Faker::Book.title }
  end
end
