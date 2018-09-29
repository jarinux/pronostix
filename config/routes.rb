Rails.application.routes.draw do

  scope module: :v1, constraints: ApiVersion.new('v1', true) do
    resources :providers, only: [:index]
    resources :users, only: [:index]
    resources :groups, only: [:index]
    get '/profile', to: 'users#profile'

  end
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'

end
