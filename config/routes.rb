Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users,
             controllers: {
               registrations: 'users/registrations',
               omniauth_callbacks: 'users/omniauth_callbacks'
             }

  root 'homes#index'
  get '/events/back_number', to: 'events#back_number'

  resources :users
  resources :events do
    resource :event_users, only: %i[create destroy]
  end
end
