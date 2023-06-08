Rails.application.routes.draw do
  get '/current_user', to: 'current_user#index'
  get '/current_user/info', to: 'current_user#show'

  devise_for :users, path: '', path_names: {
    #POST request to /login 
    sign_in: 'login',
    #DELETE request to /logout
    sign_out: 'logout',
    #POST request to /signup
    registration: 'signup'
  },
  controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
  }

# POST requests for users must be in the format:
#   {
#     "user": {
#       "email": "test@test.com",
#       "password": "password"
#     }
#   }

  resources :users do 
    resources :jobs do
    end
  end

  # get "users/:user_id/jobs/:id", to: "jobs#show"
  # get "users/:user_id/jobs", to: "jobs#index"
  # post "users/:user_id/jobs", to: "jobs#create"

  get "jobs", to: "jobs#all"
  get "jobs/:id", to: "jobs#one"
  get "jobs/:id/applications", to: "applications#index"

end