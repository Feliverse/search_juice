Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get '/searches', to: 'searches#search'  # Ruta para mostrar el formulario de búsqueda
  get '/process_search', to: 'searches#process_search'  # Ruta para procesar la búsqueda
end
