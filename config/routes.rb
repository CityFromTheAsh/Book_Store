Rails.application.routes.draw do
  resources :users, only: [:index] do
    collection do
      get :buyed
      get :sold
      get :reviews
      get :current_lots
      get :show
    end
  end
  resources :accounts
  resources :orders
  root 'pasteboard#home'

  get 'pasteboard/home'

  get 'pasteboard/about'

  get 'pasteboard/contact'

  resources :books
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
