Rails.application.routes.draw do
  root 'pasteboard#home'

  get 'pasteboard/home'

  get 'pasteboard/about'

  get 'pasteboard/contact'

  resources :books
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
