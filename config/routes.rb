Rails.application.routes.draw do
  root 'static_pages#top'

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  resources :users, only: %i[new create]
  resources :happies, only: %i[index]
  resources :items, only: %i[index] do
    resource :happies, only: %i[create destroy]
    resource :angries, only: %i[create destroy]
    resource :normals, only: %i[create destroy]
  end
end
