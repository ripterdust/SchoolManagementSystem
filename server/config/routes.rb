Rails.application.routes.draw do
  resources :users

  get '/', to: "home#index"
  post '/auth/login', to: "authentication#login"
  post '/auth/register', to: "authentication#register"
end
