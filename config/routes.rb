Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/search', to: 'posts#search', as: 'search'
  resources :posts
  resources :authors, path: 'author', only: %i[show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
