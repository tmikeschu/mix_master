Rails.application.routes.draw do
  resources :artists do
    resources :songs, only: [:new, :index, :create, :show, :edit, :update, :destroy]
  end
  resources :songs, only: [:show] 
  resources :playlists, only: [:index, :new, :create, :show, :edit, :update]
end
