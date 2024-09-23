Rails.application.routes.draw do
  root 'memories#new'
  get 'memories/show', to: 'memories#show'
end
