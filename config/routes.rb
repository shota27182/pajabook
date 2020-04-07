Rails.application.routes.draw do

  get '/' =>"home#top"
  post "users/:id/update" => "users#update"
  get "users/:id/edit" => "users#edit"
  post "users/create" => "users#create"
  get "signup" => "users#new"
  get "users/index" => "users#index"
  get "users/:id" => "users#show"
  post "login" => "users#login"
  post "logout" => "users#logout"
  get "login" => "users#login_form"


  get 'books/index' => "books#index"
  get 'books/details/:field' => "books#details"
  get "books/new" => "books#new"
  get "books/:id" => "books#show"
  post "books/create" => "books#create"
  get "books/:id/edit" => "books#edit"
  post "books/:id/update" => "books#update"
  post "books/:id/destroy" => "books#destroy"
  post "books/:id/hello" =>"books#hello"
  post "books/:id/bye" =>"books#bye"
  get 'books/search' =>"books#search"



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
