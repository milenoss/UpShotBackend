Rails.application.routes.draw do
 namespace :api do 
  namespace :v1 do 
    resources :users, only: [:create, :index, :show]
    resources :events, only:[:create, :show]
     post '/login', to: 'users#login'
     get '/validate', to: 'users#validate'
  end
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
