Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :restaurants do
    # "/restaurants"
    resources :reviews, only: [:index, :new, :create]
    collection do
      get :top
    end
  end
  resources :reviews, only: [:show, :edit, :update, :destroy]
end
