Rails.application.routes.draw do
  # get "/posts" => "posts#index"
  # get "/posts/:id" => "posts#show"
  # post "/posts" => "posts#create"
  # put "/posts/:id" => "posts#update"
  # delete "/posts/:id" => "posts#destroy"

  resources :posts do
    resource :comments
  end

  #comments is nested resource

end

# resources :posts - negates need to write out all these routes by hand
  # specifying routes - is bad practice in rails
