Rails.application.routes.draw do
  get 'home/about', to: 'root#about'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'root#top'

  resources :users, only: [ :index, :show, :edit, :update, :destroy]
  resources :books
end

