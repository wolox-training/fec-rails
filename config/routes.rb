# frozen_string_literal: true

Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :books, only:[:show, :index]
      resources :rents, only: [:create, :index]
    end
  end
  mount_devise_token_auth_for 'User', at: '/auth', skip: [:omniauth_callbacks]
end
