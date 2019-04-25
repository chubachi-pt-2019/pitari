Rails.application.routes.draw do
  root 'discuss#new'
  resources :discuss, only: [:index, :new, :create, :show]
  patch '/discuss',    to: 'discuss#create'
end
