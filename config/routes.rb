KanbanBoard::Application.routes.draw do
  
  resources :projects do
    resources :user_stories do
      post 'update_status', :on => :collection
    end
  end
  root :to => 'projects#index'
  
end
