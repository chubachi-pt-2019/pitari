Rails.application.routes.draw do
  root 'discuss#new'
  get 'discuss/index', to: 'discuss#index'
end
