Rails.application.routes.draw do
  resources :users, :courses
  
  get '/', to: "home#index"

  # Schools routes
  get '/schools', to: "school#index"

  # Get user data
  get '/user', to: "users#get_user_data"

  # Authentication
  post '/auth/login', to: "authentication#login"
  post '/auth/register', to: "authentication#register"
end
