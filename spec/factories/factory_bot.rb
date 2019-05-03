require 'factory_bot'
require 'faker'
RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

FactoryBot.define do
  factory :book do
    genre {Faker::Book.genre}
    author {Faker::Book.author}
    image {Faker::File.file_name('foo/bar', 'baz', 'jpg')}
    editorial {Faker::Book.publisher}
    year {Faker::Date.birthday}
    title{Faker::Book.title}
  end
end
