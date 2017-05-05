Rails.application.routes.draw do
  resources :users
  root 'homes#index'
  get 'welcome', to: 'users#welcome'
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'
  post 'login', to: 'sessions#create'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
