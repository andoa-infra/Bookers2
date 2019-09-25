Rails.application.routes.draw do
  get 'root/about'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'root#top'


  resources :users, only: [:show, :edit, :update]
  resources :books
end
