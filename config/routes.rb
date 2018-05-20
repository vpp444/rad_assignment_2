Rails.application.routes.draw do

 
  resources :news do
    resources :comments
  end
 
  
  

  get 'abouts/display'

  get "/newcomments" => "comments#index"
  
  get "/login" => "login#index"
  
  get "/submit" => "news#new"

  post 'sessions/create'

  post 'user/create'
  
  delete "logout" => "sessions#logout", :as => "logout"
  
  get 'news/next'
  
  root 'login#index'

end
