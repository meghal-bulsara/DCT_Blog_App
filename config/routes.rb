Rails.application.routes.draw do
  resources :advertisements
  resources :authors
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :articles, :categories, :comments
  root "articles#index"
end
