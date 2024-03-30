Rails.application.routes.draw do
  resource :users

  post '/auth/login', to: "authentication#login"
end
