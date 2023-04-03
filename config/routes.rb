Rails.application.routes.draw do
  get 'lectures/show'
  devise_for :users
  get 'subjects/show'
  get 'pages/index'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: 'pages#index'
  get '/home', to: 'pages#home'

  resources :subjects do
    resources :notes, only: [:show] do
      resources :comments
    end
    resources :lectures, only: [:show] do
      resources :appoinments, only: %i[new destroy]
      # get '/:lecture_id/appoinment/new', to: 'appoinments#create'
      # delete '/:lecture_id/appoinment/delete', to: 'appoinments#destroy'
    end
  end
end
