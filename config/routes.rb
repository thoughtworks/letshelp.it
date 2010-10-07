LetshelpIt::Application.routes.draw do
  
  # The priority is based upon order of creation: first created -> highest priority.

  match '/' => 'home#index'
  match '/about' => 'home#about', :as => :about, :via => 'get'

  match '/organizations/search' => 'organizations#search', :as => :search, :via => 'get'
  match '/organizations/ajax_edit' => 'organizations#ajax_edit', :as => :ajax_edit
  resources :organizations

  match '/:id' => 'organizations#show', :as => :organization_shortcut
  
end
