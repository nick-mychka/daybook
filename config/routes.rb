Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  defaults format: :json do
    resources :users, only: [:create]

    post "/login", to: "users#login"
    get '/check_login', to: 'users#check_login'
  end

  root "welcome#index"
end
