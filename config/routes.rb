Rails.application.routes.draw do
  get 'feelings/new'
  get 'feelings/index'
  post 'feelings/vote', to: "feelings#vote"
  get 'feelings/result', to: "feelings#result"
  post 'feelings/create', to: "feelings#create"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
