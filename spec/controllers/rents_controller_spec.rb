# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::RentsController, type: :controller do
  include_context 'Authenticated User'
  describe 'GET #create' do
    it 'returns http success' do
      get :create
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
