Rails.application.routes.draw do
  root 'discuss#new'
  get  'new', to: 'discuss#new'    
end
