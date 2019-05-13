# frozen_string_literal: true

require 'rails_helper'

describe Api::V1::BooksController, type: :controller do
  describe 'GET BooksController#index' do
    let(:book) {FactoryBot.create :book, 5}
    it "get index is valid request when user is signed_in" do
      m = create(:user)
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @request.headers.merge! m.create_new_auth_token
      sign_in m
      get :index
      expect(response.status).to eq(200)
    end
  end
end
 describe 'GET BooksController#index' do
   include_context 'Authenticated User'
   context 'When fetching all the books' do
     before do
       get :index
     end

    it 'responses with the users books json' do
      expected = ActiveModel::Serializer::CollectionSerializer.new(
      books, serializer: BookSerializer).to_json
      expect(response_body.to_json) =~ JSON.parse(expected)
    end
  end
end
