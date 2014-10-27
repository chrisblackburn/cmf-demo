Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get '/content/:slug', to: 'content#show', as: 'content'
  get '/dataset', to: 'dataset#show', as: 'dataset'
end
