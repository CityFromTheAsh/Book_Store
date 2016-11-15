Rails.application.routes.draw do
  get 'user/index'

  get 'user/buyed'

  get 'user/sold'

  get 'user/reviews'

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
