Rails.application.routes.draw do
  root 'discuss#new'
  get  'new', to: 'discuss#new'    
  post 'discuss', to: 'discuss#create'
  get  'discuss', to: 'discuss#show'
end
