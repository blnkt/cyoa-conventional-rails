Rails.application.routes.draw do
  devise_for :users
  root to: 'adventures#index'
  resources :users, only: [:show]
  resources :adventures do
    resources :chapters
  end
end
