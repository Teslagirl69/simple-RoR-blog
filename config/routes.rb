# frozen_string_literal: true

Rails.application.routes.draw do
  get 'search', to: "search#index"
  devise_for :users
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  root to: 'home#index'
  get 'home/index'
  get 'terms' => 'pages#terms'
  get 'about' => 'pages#about'

  resource :contacts, only: %i[new create], path_names: { new: '' }
  resources :articles do
    resources :comments
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
