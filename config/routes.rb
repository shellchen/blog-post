PostitTemplate::Application.routes.draw do
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  resources :users, only: [:show, :new, :create]

  resources :posts, except: :destroy do
    resources :comments, only: [:create]
  end

  resources :categories, except: [:destroy]
  
  root to: 'posts#index'
end
