Rails.application.routes.draw do
  devise_for :users
  root 'categories#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:edit, :update, :show]
  resources :experts, only: [:new, :create]
  resources :categories, only: :index do
    resources :experts, except: [:new, :create]
  end
end
