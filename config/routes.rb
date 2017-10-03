Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
get 'cart/show'
root 'products#index'
root 'cart#show'
resources :products do 
	member do 
		post :create_order_items
	end
end
resources :orders
resources :cart 
resources :order_items

end
