# frozen_string_literal: true

require 'rails_helper'

describe Api::V1::BooksController, type: :controller do
  describe 'GET #index' do
    let!(:books) { create_list(:book, 3) }
    context 'When fetching all the books in the datebase with authenticate_user' do
      include_context 'Authenticated User'
      subject(:index_request) do
        get :index
      end

      it 'responses with the users book json' do
        expected = ActiveModel::Serializer::CollectionSerializer.new(books, each_serializer: BookSerializer).to_json
        expect(index_request.body.to_json).to eq( expected )
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'GET #show' do
    context 'When fetching a book' do
      let!(:book) { create_list(:book, 1) }
      subject(:http_request) do
        get :show, params: { id: book.id }
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end

      it 'responses with the book' do
        expected = ActiveModel::Serializer::CollectionSerializer.new(book, each_serializer: BookSerializer).to_json
        expect(response.body.to_json) =~ JSON.parse(expected)
      end
    end
  end
end
