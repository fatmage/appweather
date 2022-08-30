Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "city#index"
  get "show_city" => "city#show_city"
  get "/res" => "city#show_city"
end
