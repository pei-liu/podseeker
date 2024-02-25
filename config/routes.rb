Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get '/search_episodes', to: 'episodes#search'
  get '/health', to: 'health_check#index'

  # Defines the root path route ("/")
  # root "posts#index"
end
