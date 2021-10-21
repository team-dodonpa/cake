Rails.application.routes.draw do
    root 'homes#top'
    get 'homes/top'
    get 'homes/about'
    devise_for :customers
    resources :cart_details
    resources :items
    resources :homes
# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    resources :customers do
    collection do
	     get 'quit'
	     patch 'out'
    end
	 end
    resources :deliveries

  devise_for :admin, skip: [:passwords,],containers: {
      sessions:  'admin/sessions'
  }

    namespace :admin do
    resources :items
    resources :customers
    resources :genres
    resources :orders
    end
end