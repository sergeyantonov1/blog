Rails.application.routes.draw do
  mount Ckeditor::Engine => "/ckeditor"
  devise_for :users, controllers: { registrations: "users/registrations" }

  resources :articles do
    resources :comments, only: %i[create destroy]
  end

  root to: "articles#index"
end
