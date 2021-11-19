Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # Almost every application defines a route for the root path ("/") at the top of this file.
  root 'top#index'

  # users
  resources :users, only: [:show, :create, :edit, :update, :destroy], param: :username

  scope '/auth' do
    get '/sign_up', to: 'users#new'
    get '/log_in', to: 'auth#new'
    post '/log_in', to: 'auth#create'
    delete '/log_out', to: 'auth#destroy'
  end
end
