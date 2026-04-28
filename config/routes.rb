Rails.application.routes.draw do
#  root "application#hello"

resources :articles

root "pages#home"

get "about", to: "pages#about"
end
