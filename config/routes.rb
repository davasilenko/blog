Rails.application.routes.draw do
  get "comments/create"
  get "articles/index"
  get "articles/show"
  get "sessions/new"
  get "sessions/create"
  get "sessions/destroy"
  get "users/new"
  get "users/create"
  root 'articles#index'

  resources :articles, only: [:index, :show] do
    resources :comments, only: [:create]
  end

  get 'signup', to: 'users#new', as: 'signup'
  resources :users, only: [:create]

  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create'

  # Маршрут для выхода из системы
  get 'logout', to: 'sessions#destroy', as: 'logout'
end
