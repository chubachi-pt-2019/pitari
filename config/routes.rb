Rails.application.routes.draw do
  root 'discuss#new'
  resources :discuss, only: [:index, :new, :create, :show]
  resources :users, only: [:new, :create]
  patch '/discuss',    to: 'discuss#create'
  mount ActionCable.server => '/cable'
end
