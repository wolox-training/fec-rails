Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :books
      get 'api/v1/books/show', to: 'books#show', controller: 'books'
      get 'api/v1/books/index', to: 'books#index', controller: 'books'
    end
  end
  mount_devise_token_auth_for 'User', at: '/auth'
  get '/': root 'welcome#index'
end
