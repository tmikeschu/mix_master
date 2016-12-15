Rails.application.routes.draw do
  resources :artists do
    resources :songs, except: [:patch]
  end
  resources :songs, only: [:show] 
  resources :playlists, only: [:index, :new, :create, :show, :edit, :update]
end
