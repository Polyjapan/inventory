Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # Authentification system (devise gem)
  devise_for :users, :skip => [:registrations]
  devise_scope :user do
    match "/login", :to => "devise/sessions#new", via: :get
    match "/logout", :to => "devise/sessions#destroy", via: :get
    match "/signup", :to => "devise/registrations#new", via: :get
    match "/me", :to => "devise/registrations#edit", via: :get
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end

  # '/'
  root 'home#root'

  # User management
  resources :users, :only => [:index, :edit, :update, :new, :create, :destroy]

  # Inventory
  match '/inventory', :to => "inventory#index", via: :get
  match '/inventory', :to => "inventory#destroy", via: :delete
  match '/inventory/create', :to => "inventory#create", via: :post
  match '/inventory/:id/edit', :to => "inventory#edit", via: :get
  match '/inventory/:id', :to => "inventory#update", via: :patch

  # Items
  #match '/items', :to => "items#index", via: :get
  resources :items, :only => [:index, :create, :update, :destroy, :edit, :show]

  # Locations
  #match '/locations', :to => "locations#index", via: :get
  resources :locations, :only => [:index, :create, :update, :destroy, :edit, :show]
end
