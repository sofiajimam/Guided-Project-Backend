Rails.application.routes.draw do
  post "/graphql", to: "graphql#execute"

  # Session routes
  post '/login', to: 'sessions#create'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
