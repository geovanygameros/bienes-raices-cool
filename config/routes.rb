Rails.application.routes.draw do
  root 'properties#index'
  get '/load_properties' => 'properties#load_properties'
  resources :properties, only: [:index, :show]
end
