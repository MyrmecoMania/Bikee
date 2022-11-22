Rails.application.routes.draw do
  get 'rents/new'
  get 'rents/create'
  get 'rents/edit'
  get 'rents/update'
  get 'rents/destroy'
  root to: "pages#home"
  resources :bikes
  get "dashboard", to: "pages#dashboard"
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
