Rails.application.routes.draw do
 devise_for :users

  root to: 'items#index'
  resources :items do
   resources :purchases, only:[:index, :new, :create]
   resources :users, only:[:index, :create]
  end
 end


