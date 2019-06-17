Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  post '/users/send_request/:id', to: 'users#send_request'

  resources :posts, only: %i[index create destroy show] do
    resources :comments, only: [:index]
  end
  resources :users
  resources :likes, only: [:create, :destroy]
  resources :comments, only: [:create, :index, :destroy, :comments_of_post]

  root to: "users#index"

end
