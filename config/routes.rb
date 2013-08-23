SampleApp::Application.routes.draw do

  get "home/index"

#authenticated :user do
#   root :to => 'users#show'
#  end

  root :to => "home#index"

  devise_for :users
  #resources :users

  devise_for :admins
  #resources :admins

  authenticated :user do
      root :to => 'home#index' 
  end

  authenticated :admin do
  	root :to => 'admins#index'
  end

  # resources :admins do
  #   resources :companies
  # end

  resources :users do
    resources :companies do
		member do
			get 'base'
			get 'projects'
			get 'contact'
			get 'address'
			get 'demos'
			get 'owner'
		end
	end
  end

  match '/help',    to: 'static_pages#help'
  match '/about',   to: 'static_pages#about'
  match '/contact', to: 'static_pages#contact'

  resources :companies do
  	resources :addresses, :owners, :contacts
    resources :demos do
		member do
			get 'view'
		end
	end
	resources :projects do
		member do
			get 'view'
		end
	end
  end

end
