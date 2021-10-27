Rails.application.routes.draw do
    devise_for :admin, controllers: {
  sessions: "admin/sessions"
}
    root 'homes#top'
    get 'homes/top'
    get 'homes/about'
   devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
   }
    resources :cart_details do
    collection do
    delete 'destroy_all'
    end
  end
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
    resources :orders do
     collection do
         get 'confirm'
         get 'complete'
     end
    end


    namespace :admin do
    resources :items
    resources :customers
    resources :genres
    resources :orders
    resources :order_details
    end
end