Rails.application.routes.draw do
  root "lists#index"

  resources :lists do
    resources :bookmarks, only: [ :new, :create ]
    resources :reviews, only: [:create]
  end
  resources :bookmarks, only: [ :destroy ]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
