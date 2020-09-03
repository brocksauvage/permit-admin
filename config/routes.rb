Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  get '/', to: 'welcome#index'

  devise_for :users, skip: [:sessions]

  as :user do
    get '/login', to: 'devise/sessions#new', as: :new_user_session
    post '/login', to: 'devise/sessions#create', as: :user_session
    get '/logout', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  get 'teams/:team_id', to: 'teams#show', as: :team
  get 'teams/:team_id/permits', to: 'team_permit_submissions#index', as: :team_permit_submissions
  get 'teams/:team_id/permits/:permit_id', to: 'team_permit_submissions#show', as: :team_permit_submission
  get 'teams/:team_id/permits/:permit_id/edit', to: 'team_permit_submissions#edit', as: :team_permit_submission_edit
  delete '/permits/:id', to: 'team_permit_submissions#destroy'

  get '/permits', to: 'permit_submissions#index', as: :permit_submissions
  post '/permits', to: 'permit_submissions#create'
  get '/permits/new', to: 'permit_submissions#new'
  get '/permits/:id', to: 'permit_submissions#show', as: :permit_submission
  get '/permits/:id/edit', to: 'permit_submissions#edit', as: :permit_edit
  patch '/permits/:id', to: 'permit_submissions#update'
  delete '/permits/:id', to: 'permit_submissions#destroy', as: :permit_delete

  resources :alerts, only: [:index]
end
