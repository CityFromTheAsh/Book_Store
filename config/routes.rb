Rails.application.routes.draw do
  resource :message

  root 'pasteboard#home'
  get 'pasteboard/about'
  get 'pasteboard/contact'

  devise_for :users,  controllers: {
      registrations: 'user_devise_controller/registrations'
  }
  resources :users do
    collection do
      get :index
      get :buyed
      get :sold
      get :reviews
      get :current_lots
      get :show
    end
    member do
      put :ban
    end
  end

  resources :users do
    resource :messages
    resources :books
    devise_for :users,  controllers: {
        registrations: 'user_devise_controller/registrations'
    }
  end

  resources :books
  resources :books do
    resources :orders

  end
  resources :messages

  resources :orders


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
