Rails.application.routes.draw do
  resources :todos
	map.resources :todos, :collection => { :edit_multiple => :post, :update_multiple => :put }

  root 'welcome#index'
end
