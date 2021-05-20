Rails.application.routes.draw do
  resources :posts do
    resources :comments, shallow: true
  end
  root to: 'posts#index'
  get 'sessions/new'
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  delete 'logout', to: 'sessions#destroy', as: 'logout'
  resources :users
  resources :sessions
  resources :password_resets
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
