PostitTemplate::Application.routes.draw do
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"

  resources :users, only: [:show, :new, :create]
  resources :categories, except: [:destroy]

  resources :posts, except: :destroy do
    member do
      post 'vote'
    end

    resources :comments, only: [:create] do
      member do
        post 'vote'
      end
    end
  end
  
  root to: 'posts#index'
end
