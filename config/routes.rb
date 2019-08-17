Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :users

  resources :events do
    resource :event_users, only: %i[create destroy]
  end

  root 'homes#index'

end
