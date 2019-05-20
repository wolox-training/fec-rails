# frozen_string_literal: true

Rails.application.routes.draw do
  get 'rents/create'

  get 'rents/index'

  namespace 'api' do
    namespace 'v1' do
      resources :books
      get 'api/v1/books/show', to: 'books#show', controller: 'books'
      get 'api/v1/books/index', to: 'books#index', controller: 'books'
      post 'api/v1/rents/create', to: 'rents#create', controller:'rents'
      get 'api/v1/rents/index', to: 'rents#index', controller:'rents'
    end
  end
  mount_devise_token_auth_for 'User', at: '/auth'
end
