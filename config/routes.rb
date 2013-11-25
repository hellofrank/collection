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


  match "/articles/:id" => "home#show_article"
  match "/projects/:id" => "projects#show", :as => :project, :via => :get
  match '/articles/:id/comment' => 'comments#create', :as => :comment_create, :via => :post
  #match ':controller/:action/:id/:user_id'
  resources :articles

  namespace :admins do
	match "manager" => "admins#index"
	match "users" => "admins#users"
	#match "companies" => "companies#index", :as => :companies, :via => :get
	match "/company/updateshow", to:'companies#updateshow'
	resources :companies do
		resource :address, :except =>[:show]
		resource :contact,  :except =>[:show]
		resource :owner, :except =>[:show]
		resources :projects, :except => [:show]
		resources :demos, :except => [:show]
	end

	resources :index_images, :except => [:show,:index]
	resources :articles
	resources :logs
  end

  authenticated :user do
      root :to => 'home#index' 
  end

  authenticated :admin do
  	root :to => 'admins#show'
  end

   resources :users do
	   resources :logs
   end

  resources :logs

  resources :companies, :except => [:new, :create, :update, :edit, :destroy]
  match '/companies/:id/about', to: 'companies#about', :as => :company_about, :via => :get
  match '/companies/:id/contact', to: 'companies#contact', :as => :company_contact, :via => :get
  match '/companies/:id/owner', to: 'companies#owner', :as => :company_owner, :via => :get
  match '/companies/:id/service', to: 'companies#service', :as => :company_service, :via => :get
  match '/help',    to: 'static_pages#help'
  match '/about',   to: 'static_pages#about'
  match '/contact', to: 'static_pages#contact'

end
