TwitterApp::Application.routes.draw do


  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  resources :twitter_updates, :only => [:new, :create]
  
  root :to => 'home#index'
  
  
end
