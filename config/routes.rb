# config/routes.rb
Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "users/registrations" }
  resources :users
  resources :campaigns do
    resources :discussion_topics do
      resources :comments, only: [:create, :destroy]
    end
    resources :tags
    resources :todos
    resources :comments, only: [:create, :destroy]
  end
end
