Rails.application.routes.draw do
  root 'pasteboard#home'
  get 'pasteboard/about'
  get 'pasteboard/contact'
  resource :pasteboard
  resources :users, only: [:index] do
    collection do
      get :buyed
      get :sold
      get :reviews
      get :current_lots
      get :show
      #get :books
    end
  end
  resources :orders
  resources :books
  devise_for :users,  controllers: {
      registrations: 'user_devise_controller/registrations'
  }
  resources :users
  resources :users do
    resources :books
    # get :user_books
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
