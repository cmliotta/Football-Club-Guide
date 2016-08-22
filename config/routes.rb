Rails.application.routes.draw do
  root 'clubs#index'
  resources :clubs, only: [:show]
end
