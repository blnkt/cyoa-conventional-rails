Rails.application.routes.draw do
  devise_for :users
  root to: 'adventures#index'
  resources :users, only: [:show]
  resources :adventures
  resources :chapters
  end
end
