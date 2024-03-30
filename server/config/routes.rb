Rails.application.routes.draw do
  resources :users

  get '/', to: "home#index"
  post '/auth/login', to: "authentication#login"
end
