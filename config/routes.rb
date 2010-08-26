ActionController::Routing::Routes.draw do |map|

  # The priority is based upon order of creation: first created -> highest priority.

  map.root :controller => "home"
  map.connect '/about', :controller => 'home', :action => 'about', :conditions => { :method => :get }
  
  map.connect '/organizations/search', :controller => 'organizations', :action => 'search', :conditions => { :method => :get }
  map.connect '/organizations/ajax_edit', :controller => 'organizations', :action => 'ajax_edit'
  map.resources :organizations
  
  map.organization_shortcut '/:id', :controller => 'organizations', :action => 'show'

end
