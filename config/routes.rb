Rails.application.routes.draw do
  root 'pasteboard#home'
  get 'pasteboard/about'
  get 'pasteboard/contact'

  devise_for :users,  controllers: {
      registrations: 'user_devise_controller/registrations'
  }

  resources :messages
  resources :users do
    resources :books do
      member do
        put :confirm_delivery
      end
    end
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
    get :payment
  end
  resources :books do
    resources :orders
  end
  resources :orders
  resource :admin
end
