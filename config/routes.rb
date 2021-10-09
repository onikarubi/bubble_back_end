Rails.application.routes.draw do
  get 'home/top'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_scope :user do
    root to: 'devise/sessions#new'
  end

  resources :users, only: [:show, :update, :edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
