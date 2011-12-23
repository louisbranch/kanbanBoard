KanbanBoard::Application.routes.draw do
  
  resources :projects do
    resources :user_stories do
      post 'update_status', :on => :collection
    end
  end
  
  resources :sessions, :only => [:create]
  match "login" => "sessions#new"
  match "logout" => "sessions#destroy"
  
  root :to => 'projects#index'
end
