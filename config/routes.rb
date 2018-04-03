Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:show, :create]
  
  resources :memories, only: [:new, :show, :create, :destroy, :edit] do
    member do
      get :details
      get :front
    end
  end
  
  resources :logs, only: [:create, :destroy, :edit, :update]
  resources :relations, only: [:create, :destroy]
  
end
