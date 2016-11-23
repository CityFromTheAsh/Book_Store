Rails.application.routes.draw do
  #3 стартовых ссылки
  #-----------------------------------
  root 'pasteboard#home'
  get 'pasteboard/about'
  get 'pasteboard/contact'
  #-----------------------------------


  #users------------------------------
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
    resources :books
    devise_for :users,  controllers: {
        registrations: 'user_devise_controller/registrations'
    }
  end


  #------------------------------------

  #books-------------------------------
  resources :books
  resources :books do
    resources :orders
      get :find
  end
  #------------------------------------

  #orders------------------------------
  resources :orders

  #------------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
