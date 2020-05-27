Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/', to: 'permit_submissions#index'
  get '/permits', to: 'permit_submissions#index', as: :permit_submissions
  post '/permits', to: 'permit_submissions#create'
  get '/permits/new', to: 'permit_submissions#new'

  delete '/permits/:id', to: 'permit_submissions#destroy', as: :permit_submission
  get '/permits/:id', to: 'permit_submissions#show'
end
