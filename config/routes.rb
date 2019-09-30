Rails.application.routes.draw do
  get 'root/about'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'root#top'
  get 'users/home'

  resources :users, only: [ :index, :show, :edit, :update]
  resources :books
end

