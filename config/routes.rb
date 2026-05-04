Rails.application.routes.draw do
root "pages#home"
get "about", to: "pages#about"
resources :articles  # REST_FULL Routes
# resources :articles, only: [ :show, :index, :new, :create, :edit, :update, :destroy ].
get "signup", to: "users#new"
# post "users", to: "users#create"
resources :users, except: [ :new ] # REST_FULL Routes
get "login", to: "sessions#new"
post "login", to: "sessions#create"
delete "logout", to: "sessions#destroy"
end
