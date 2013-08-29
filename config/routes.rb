Collection::Application.routes.draw do

  get "home/index"

  root :to => "home#index"

  devise_for :users, :skip => [:sessions, :registrations], :except => [:index]
  as :user do
	  get 'signup' => 'devise/registrations#new', :as => :new_user_registration
	  post 'signup' => 'devise/registrations#create', :as => :user_registration
	  get 'profile' => 'devise/registrations#edit', :as => :edit_user_registration
	  put 'profile' => 'devise/registrations#update', :as => :edit_user_registration
	  get 'login' => 'devise/sessions#new', :as => :new_user_session
	  post 'login' => 'devise/sessions#create', :as => :user_session
	  match 'signout' => 'devise/sessions#destroy', :as => :destroy_user_session,
		  :via => Devise.mappings[:user].sign_out_via
  end

  devise_for :admins, :controllers => { :sessions => "admins/sessions", :passwords => "admins/passwords", :registrations => "admins/registrations", :confirmations => "admins/confirmations", :unlocks => "admins/unlocks" }, :except => [:index]

  namespace :admins do
	match "manager" => "admins#index"
  end

  authenticated :user do
      root :to => 'home#index' 
  end

  authenticated :admin do
  	root :to => 'admins#show'
  end

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

  resources :companies, :except => [:new, :create,:update,:edit,:destroy] do
  	resources :addresses, :except => [:index, :show]
	resources :owners, :except => [:index, :show]
	resources :contacts, :except => [:index, :show]
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
