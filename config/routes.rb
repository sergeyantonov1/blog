Rails.application.routes.draw do
  mount Ckeditor::Engine => "/ckeditor"
  devise_for :users, controllers: { registrations: "users/registrations" }

  resources :articles do
    resources :comments, only: %i[create destroy]
  end

  resources :tags, except: %i[new create edit update destroy]

  root to: "articles#index"
end
