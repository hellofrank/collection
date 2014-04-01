Collection::Application.routes.draw do

  #get "home/index"

  root :to => "home#index"

  #devise_for :users, :skip => [:sessions, :registrations], :except => [:index]
  #as :user do
#	  get 'signup' => 'devise/registrations#new', :as => :new_user_registration
#	  post 'signup' => 'devise/registrations#create', :as => :user_registration
#	  get 'users/edit' => 'devise/registrations#edit', :as => :edit_user_registration
#	  put 'users/:id' => 'devise/registrations#update', :as => :user_registration
#	  get 'login' => 'devise/sessions#new', :as => :new_user_session
#	  post 'login' => 'devise/sessions#create', :as => :user_session
#	  match 'signout' => 'devise/sessions#destroy', :as => :destroy_user_session,
#		  :via => Devise.mappings[:user].sign_out_via
 # end

  devise_for :users, :path => "account", :controllers => { :sessions => "account/sessions", :passwords => "account/passwords", :registrations => "account/registrations", :confirmations => "account/confirmations", :unlocks => "account/unlocks"}, :except => [:index]

  devise_for :admins, :controllers => { :sessions => "admins/sessions", :passwords => "admins/passwords", :registrations => "admins/registrations", :confirmations => "admins/confirmations", :unlocks => "admins/unlocks" }, :except => [:index]


  #match "/articles/:id" => "home#show_article"
  match "/projects/:id" => "projects#show", :as => :project, :via => :get
  match '/articles/:id/comment' => 'comments#create', :as => :comment_create, :via => :post
  #match ':controller/:action/:id/:user_id'
  match '/results/:id' => "results#show", :as => :results, :via => :get
  match '/results/:id/page' => "results#get_pages", :as => :result_pages, :via => :get
  match '/companies/:id/demos' => "demos#get_demos", :as => :get_demos, :via => :get
  match '/companies/:id/results' => "doing_result_sets#get_results", :as => :get_results, :via => :get
  match '/demos/:id/' => "demos#show", :as => :demos, :via => :get
  #match '/categorys/:category' => "articles#get_categorys", :as => :categorys, :via => :get
  resources :articles, :except => [:create,:new,:update,:destroy,:edit]
  resources :categories, :except =>[:create,:update,:edit,:new,:index,:destroy]
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
        resources :doing_result_sets, :except => [:show]
    	end

      resources :doing_result_sets, :except => [:index,:show,:edit,:new,:destroy,:create,:update]do
        resources :doing_results, :except => [:show]
      end

    	resources :index_images, :except => [:show,:index]
    	resources :articles, :except => [:show]
    	resources :logs
		resources :categories, :except => [:show,:index,:update,:edit]
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

  resources :logs, :except => [:new,:create,:edit,:update,:destroy]

  #resources :staticPages

  resources :companies, :except => [:new, :create, :update, :edit, :destroy]
  #match '/companies/:id/about', to: 'companies#about', :as => :company_about, :via => :get
  #match '/companies/:id/contact', to: 'companies#contact', :as => :company_contact, :via => :get
  #match '/companies/:id/owner', to: 'companies#owner', :as => :company_owner, :via => :get
  #match '/companies/:id/service', to: 'companies#service', :as => :company_service, :via => :get
  match '/help',    to: 'static_pages#help'
  match '/about',   to: 'static_pages#about'
  match '/contact', to: 'static_pages#contact'

  #china-city
  mount ChinaCity::Engine => '/china_city'
end
