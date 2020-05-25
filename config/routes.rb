Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/', to: 'permits#index'
  get '/permits', to: 'permits#index'
  get '/permits/new', to: 'permits#new'
  post '/permits', to: 'permits#create'
end
