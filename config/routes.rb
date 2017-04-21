Rails.application.routes.draw do
  root 'users#new'
  resources :users
  resources :ideas
  resources :likes
  post 'sessions' => 'sessions#create'
  get 'logout' => 'sessions#destroy'
  post 'likes/:id' => 'likes#create'
  delete 'likes/:id' => 'likes#destroy'
end
