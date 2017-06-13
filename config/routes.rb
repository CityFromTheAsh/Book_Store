Rails.application.routes.draw do
  get 'options/show'
  get 'options/edit'
  get 'option/show'
  get 'option/edut'
  root 'pasteboard#home'
  get 'pasteboard/about'
  get 'pasteboard/contact'
  resource :options do
  end

  devise_for :users,  controllers: {
      registrations: 'user_devise_controller/registrations'
  }

  resources :messages
  resources :users do
    get :money
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
    get :order
    resources :orders
  end
  resources :orders
end
