Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }

  resources :articles
  
  root to: "pages#home"
end
