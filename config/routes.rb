Banter::Application.routes.draw do

  match "auth/facebook/callback" => "sessions#create"
  match "auth/twitter/callback" => "sessions#create"
  
  resources :rooms do
    resources :messages
  end

  resource :session

  root to: "rooms#index"

  end