Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :books
      # get 'api/v1/books/show', to: 'books#show', controller: 'books'
      get 'api/v1/books/index', to: 'books#index', controller: 'books'
    end
  end
  mount_devise_token_auth_for 'User', at: '/auth'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html



end
