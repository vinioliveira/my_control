Mycontrol::Application.routes.draw do

  resources :categories

  resources :incomes

  resources :expenses

  devise_scope :user do
    get '/login' => 'devise/sessions#new'
    get '/logout' => 'devise/sessions#destroy'
  end
    
  # match '/user' => "home#welcome", :as => :user_root
  
  devise_for :users

  root :to => "home#index"
  
end
