Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
resources :customers, only: [:show, :edit,:update]do
  collection do
  	     get 'quit'
  	     patch 'out'

  	   end
  	 end

end
