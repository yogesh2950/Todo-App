Rails.application.routes.draw do
  root "sessions#new"

  get "/signup", to: "users#new"
  post "/signup", to: "users#create"

  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"


  # get "sessions/new"
  # get "sessions/create"
  # get "sessions/destroy"
  # get "users/new"
  # get "users/create"

  # resources :users, only:
  # [:new, :create, :show]

  resources :projects


  resources :todos



  # get "/projects", to: "projects#index"
  # # here columnID is called dynamic segment and rails will match whatever value appears in that spot, like for ex project/1 and it will be passed to the controller through a special object called params.

  # get "/projects/new", to: "projects#new", as: "new_project"
  # get "/projects/:id", to: "projects#show", as: "project"
  # get "/projects/:id/edit", to: "projects#edit", as: "edit_project"
  # post "/projects", to: "projects#create"
  # patch "/projects/:id", to: "projects#update"
  # delete "/projects/:id", to: "projects#destroy"

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.

  # get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  # root "posts#index"



  # API JWT BASED
  namespace :api do
    post "/signup", to: "users#create"
    post "/login", to: "sessions#create"

    resources :projects
    resources :todos
  end
end
