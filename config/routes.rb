Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # Authentification system (devise gem)
  devise_for :users
  devise_scope :user do
    match "/login", :to => "devise/sessions#new", via: :get
    match "/logout", :to => "devise/sessions#destroy", via: :get
    match "/signup", :to => "devise/registrations#new", via: :get
    match "/me", :to => "devise/registrations#edit", via: :get
  end

  # '/'
  root 'home#root'

  # Inventory
  match '/inventory', :to => "inventory#index", via: :get
end
