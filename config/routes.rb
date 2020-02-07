Rails.application.routes.draw do
  resources :posts
  get "/posts" => "posts#index"
  get "/posts/new" => "posts#new"
  get "/posts/:id" => "posts#show"
  post "/posts" => "posts#create"
  get "/posts/:id/edit" => "posts#edit"
  patch "/posts/:id" => "posts#update"
end








