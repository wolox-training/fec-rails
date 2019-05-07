# frozen_string_literal: true

require 'factory_bot'

FactoryBot.define do
  factory :book do
    genre { Faker::Book.genre }
    author { Faker::Book.author }
    image { Faker::File.file_name('foo/bar', 'baz', 'jpg') }
    editorial { Faker::Book.publisher }
    year { Faker::Date.backward.year.to_s }
    title { Faker::Book.title }
  end
end
