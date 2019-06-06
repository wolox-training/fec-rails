# frozen_string_literal: true

require 'rails_helper'

describe Api::V1::BooksuggestionsController, type: :controller do
  describe 'POST #create' do
  context 'With the correct params' do
      let!(:booksuggestion_params) { attributes_for(:book_suggestion) }
      before do
        post :create, params: { book_suggestion: booksuggestion_params }
      end

      it 'returns http success' do
        expect(response).to have_http_status(:created)
      end
    end

    context 'with missinng link param' do
      let!(:booksuggestion_params) do
        missing_params = attributes_for(:book_suggestion)
        missing_params.as_json(only: %i[title year editorial author])
      end
      before do
        post :create, params: { book_suggestion: booksuggestion_params }
      end

      it 'get error code' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
