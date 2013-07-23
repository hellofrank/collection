SampleApp::Application.routes.draw do

#get "users/index"

#get "users/show"

  get "home/index"

#authenticated :user do
#   root :to => 'users#show'
#  end

  root :to => "home#index"

  devise_for :users
  resources :users

  devise_for :admins
  resources :admins

  authenticated :user do
      root :to => 'home#index' 
  end

  # resources :admins do
  #   resources :companies
  # end

  resources :users do
    resources :companies
  end
#get "projects/new"

#get "projects/create"

# get "projects/show"

# get "projects/index"

# get "static_pages/home"
# get "static_pages/help"
# get "static_pages/about"
# get "static_pages/contact"

#root to: 'static_pages#home'
  match '/help',    to: 'static_pages#help'
  match '/about',   to: 'static_pages#about'
  match '/contact', to: 'static_pages#contact'
  resources :companies do
     resources :projects
  end

end
