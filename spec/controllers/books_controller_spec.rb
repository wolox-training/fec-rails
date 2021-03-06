# frozen_string_literal: true

require 'rails_helper'

describe Api::V1::BooksController, type: :controller do
  include_context 'Authenticated User'
  describe 'GET #index' do
    let!(:books) { create_list(:book, 2) }
    context 'When fetching all the books in the datebase with authenticate_user' do
      before do
        get :index
      end

      it 'responds with 200 status' do
        expect(response).to have_http_status(:ok)
      end

      it 'response with json with books serialized with BookSerializer' do
        expected = ActiveModel::Serializer::CollectionSerializer.new(
          books, each_serializer: BookSerializer
        ).to_json
        expect(response_body['page'].as_json).to eq JSON.parse(expected)
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
    end
  end
end
