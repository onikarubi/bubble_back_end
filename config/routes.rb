Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_scope :user do
    root to: 'books#index'
  end

  resources :users, only: [:show, :update, :edit]
  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
