Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root to: 'application#index'
  get '/login', to: 'auth#login'
  namespace :api do
    namespace :v1 do
      resources :users
      resources :statuses
    end
  end
  mount ActionCable.server, at:'/cable'

end
