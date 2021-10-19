Rails.application.routes.draw do
  root 'homes#top'
  get 'homes/top'
  get 'homes/about'
  devise_for :customers
  devise_for :admins
  resources :cart_details
  resources :items
  resources :homes
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
