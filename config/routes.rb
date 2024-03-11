Rails.application.routes.draw do
# config/routes.rb
devise_for :users, controllers: { registrations: "users/registrations" }

# config/routes.rb
resources :users

  resources :discussion_topics do
    resources :comments, only: [:create, :destroy]
  end
  resources :todos
  resources :tags
  resources :comments, only: [:create, :destroy]
  resources :campaigns do
    resources :tags
    resources :todos
    resources :comments, only: [:create, :destroy]
    resources :discussion_topics do
      resources :comments, only: [:create, :destroy], module: :discussion_topics
    end
  end




  # root "posts#index"
end
