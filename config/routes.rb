Rails.application.routes.draw do

  get :training_sessions, to: 'training_sessions#show'
  resources :training_sessions, only: [:create, :update]

  resources :weekly_summary_mail, only: [:create]
end
