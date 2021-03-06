Rails.application.routes.draw do
  resources :post_tags
  get '/posts', to: 'posts#all_posts', as: 'keepsakes'
  resources :categories
  resources :posts
  resources :users



  post '/posts/:id/read', to: 'posts#read',  as: 'post_read'
  post '/posts/:id/unread', to: 'posts#unread',  as: 'post_unread'
  get '/allthefeels', to: 'application#allthefeels', as: 'analytics'



  resources :categories do
    resources :posts
  end


  root 'application#home', as: 'home'
  get '/login', to: "sessions#new", as: 'login'
  post '/login', to: "sessions#create"
  delete '/sessions', to: "sessions#destroy", as: 'logout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
