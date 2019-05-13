# frozen_string_literal: true

require 'rails_helper'

# describe Api::V1::BooksController, type: :controller do
#   describe 'GET BooksController#index' do
#     let(:book) {FactoryBot.create :book, 5}
#     it "get index is valid request when user is signed_in" do
#       m = create(:user)
#       @request.env["devise.mapping"] = Devise.mappings[:user]
#       @request.headers.merge! m.create_new_auth_token
#       sign_in m
#       get :index
#       expect(response.status).to eq(200)
#     end
#   end
# end

describe Api::V1::BooksController, type: :controller do

  describe 'GET BooksController#index' do
    let(:book) {FactoryBot.create :book}
    context 'When fetching all the books when user is logged in' do
      include_context 'Authenticated User'
      before do
        get :index
      end

      it 'responses with books json' do
        expected = ActiveModel::Serializer.new(book, each_serializer: BookSerializer).to_json
        expect(response) =~ JSON.parse(expected)
      end

    end

    context 'when user is not logged in'
      before do
        get :index
      end

      it 'Does not response with book list'
        expect(response) eq()
  end
end
