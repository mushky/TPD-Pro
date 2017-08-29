Rails.application.routes.draw do
  devise_for :users
  
  resources :todos do
  	resources :comments
  end

  root 'welcome#index'

end
