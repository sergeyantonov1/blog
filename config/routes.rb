Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, controllers: { registrations: "users/registrations" }

  resources :articles

  root to: "articles#index"
end
