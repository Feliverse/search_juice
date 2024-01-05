Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "searches#search"

  get '/searches', to: 'searches#search'  
  get '/process_search', to: 'searches#process_search'  
  get '/statistics', to: 'searches#statistics', as: 'statistics'
end
