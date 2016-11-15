Rails.application.routes.draw do
  get 'users/index'

  get 'users/buyed'

  get 'users/sold'

  get 'users/reviews'
  get 'users/current_lots'

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
