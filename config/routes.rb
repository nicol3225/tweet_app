Rails.application.routes.draw do
  get "users/login" => "users#login"
  get "users/logout" => "users#logout"
  get "users/mypage" => "users#mypage"
  post "users/login_form" => "users#login_form"
  get "users/new"  =>  "users#new"
  post "users/create"  =>  "users/create"
  get "posts/index" => "posts#index"
  get "/" => "home#top"
  get "about" => "home#about"
  get "posts/new" => "posts#new"
  post "posts/create" => "posts#create"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/delete" => "posts#delete"
  post "posts/:id/update" => "posts#update"
  get "posts/:id" => "posts#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
