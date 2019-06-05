# frozen_string_literal: true

Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: '/auth'
  namespace 'api' do
    namespace 'v1' do
      resources :books, only: [:show, :index, :find_book]
      resources :rents, only: [:create, :index]
      resources :booksuggestions, only: [:create]
    end
  end
end
