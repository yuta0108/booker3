Rails.application.routes.draw do

  resources :videos
  devise_for :users
  root to: 'homes#top'
  get "/homes/about" => "homes#about", as: "about"
  resources :books, only: [:index, :show, :edit, :create, :destroy, :update] do
    resource :favorites, only: [:create, :destroy]
  end

  resources :users, only: [:index, :show, :edit, :update] do
    member do
        get :follows, :followers
      end
        resource :relationships, only: [:create, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
