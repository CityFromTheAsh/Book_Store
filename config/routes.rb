Rails.application.routes.draw do
  root 'pasteboard#home'
  get 'pasteboard/about'
  get 'pasteboard/contact'

  devise_for :users,  controllers: {
      registrations: 'user_devise_controller/registrations'
  }

  resources :messages
  resources :users do
    resources :books
    resource :messages
    collection do
      get :index
      get :sold
      get :reviews
      get :show
    end
    member do
      put :ban
    end
  end
  resources :books do
    resources :orders
  end
  resources :orders
end
