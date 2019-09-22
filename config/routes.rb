Rails.application.routes.draw do

  root to: "homepage#index"
  
  resources :projects do 
    resources :boards
  end
  
  post "/board/:board_id/items", to: "board_items#create", as: "board_items"  
  
  devise_for :users, path: 'auth', 
  path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', 
  unlock: 'unblock', registration: 'register', sign_up: 'cmon_let_me_in' }, controllers: { registrations: "registrations" }
  
  get "/dashboard", to: "dashboard#index"
  
end
