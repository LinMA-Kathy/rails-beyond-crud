  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  # Defines the root path route ("/")
  # root "articles#index"

Rails.application.routes.draw do
  get 'reviews/new'
  resources :restaurants do
    collection do
      get :top
    end

    member do
      get :chef
    end

    resources :reviews, only: [:new, :create]
  end

  resources :reviews, only: [:destroy]
end
