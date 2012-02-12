KanbanBoard::Application.routes.draw do

  resource :home, :only => [:show], :controller => 'home'

  resources :projects do
    resources :statuses
    resources :members, :only => [:index, :new, :create, :destroy]
    resources :user_stories, :except => [:index, :show] do
      post 'update_status', :on => :collection
      resources :issues, :except => [:index, :show]
    end
  end

  resources :users, :only => [:create]
  match "signup" => "users#new"
  resource :account, :only => [:show, :edit, :update, :destroy], :controller => 'users'
  resource :password, :only => [:edit, :update], :controller => 'user_password'
  resources :reset_passwords, :only => [:new, :create, :edit, :update]

  resources :sessions, :only => [:create]
  match "login" => "sessions#new"
  match "logout" => "sessions#destroy"

  resources :invitations, :only => [:create, :update, :destroy]

  root :to => 'home#show'
end
