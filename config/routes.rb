Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_scope :user do
    root to: 'books#index'
  end

  resources :users, only: %i[show update edit]
  resources :books do
    resource :favorites, only: %i[create destroy]
    resources :comments, only: %i[create edit update destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
