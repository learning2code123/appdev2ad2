Rails.application.routes.draw do
  
  #get "/", controller: "movies", action: "new"

  #get "/" => "movies#index"

  root "movies#index"

  # Routes for the Movie resource:

  # CREATE
  post "/movies" => "movies#create", as: :movies #movies_url and movies_path
  get "/movies/new" => "movies#new", as: :new_movie #new_movie_url and new_movie_path 
          
  # READ (usually get indicates reading)
  get "/movies" => "movies#index" 
  
  get "/movies/:id" => "movies#show", as: :movie #movie_path() expects an argument to populate the :id segment
  
  # UPDATE
  
  patch "/movies/:id" => "movies#update" 
  get "/movies/:id/edit" => "movies#edit", as: :edit_movie #edit_movie_path() expects an argument to populate the :id segment
  
  # DELETE
  delete "/movies/:id" => "movies#destroy" 

  #------------------------------

  resources :books
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
