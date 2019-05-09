# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::BooksController, type: :controller do
  include_context 'Authenticated User'

  describe 'GET #index' do
    context 'when fetching all books in the DataBase' do
      let! (:rents) {create_list(:book, 5)}

      before do
        get :index, params: {id: book.id}
      end

      it 'responses with books json' do
        expected = ActiveModel::Serializer::CollectionSerializer.new(book, each_serializer: BookSerializer).to_json
        expect(response_body.to_json) =~ JSON.parse(expected)
      end
    end
  end

  describe 'GET #show' do
    context 'When a book id is given' do
      let!(:book) { create(:book, 5) }

      before do
        get :show, params: {book_id: book.id}
      end

      it 'Responses with the book associated with the id as a JSON' do
        expect(response_body.to_json).to_eq BookSerializer.new(book, root: false).to_json
      end
    end
  end
end
