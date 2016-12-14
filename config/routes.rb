Rails.application.routes.draw do
  resources :artists do
    resources :songs, only: [:new, :index, :create, :show]
  end
  resources :songs, only: [:show] 
end
