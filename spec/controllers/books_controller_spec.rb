# frozen_string_literal: true

require 'rails_helper'
include ActionController::RespondWith

describe Api::V1::BooksController, type: :controller do
  describe 'GET BooksController#index' do
    let(:book) {FactoryBot.create :book}
    before(:each) do
      @current_user = FactoryBot.create(:user)
    end
    context 'it gives you autenticates headers'
      it "gives you an authentication code if you are an existing user and you satisfy the password" do
        login
        # puts "#{response.headers.inspect}"
        # puts "#{response.body.inspect}"
        expect(response.has_header?('access-token')).to eq(true)
        end
      end
    context 'When fetching all the books when user is logged in' do
      before do
        login
        auth_params = get_auth_params_from_login_response_headers(response)
        get :index, params: auth_params
      end

      it 'responses with books json' do
        expected = ActiveModel::Serializer.new(book, each_serializer: BookSerializer).to_json
        expect(response) =~ JSON.parse(expected)
      end

    end

    context 'when user is not logged in' do
      before do
        get :index
      end

      it 'Does not response with book list' do
        expect(response).to eq(200)
      end
    end
 end

#-----------------------------------------------------------

def login
    post '/auth/sign_in/', params: { email: @current_user.email, password: @current_user.password}
end

def get_auth_params_from_login_response_headers(response)
      client = response.headers['client']
      token = response.headers['access-token']
      expiry = response.headers['expiry']
      token_type = response.headers['token-type']
      uid =   response.headers['uid']

      auth_params = {
                      'access-token' => token,
                      'client' => client,
                      'uid' => uid,
                      'expiry' => expiry,
                      'token_type' => token_type
                    }
      auth_params
end
