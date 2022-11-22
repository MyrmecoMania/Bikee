Rails.application.routes.draw do
  root to: "pages#home"
  resources :bikes
  get "dashboard", to: "pages#dashboard"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
