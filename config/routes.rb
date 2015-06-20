Rails.application.routes.draw do
  delete "delete" => "todos#delete", :as => :delete
  post 'todos/complete' => 'todos#complete', :via => :post 
  #get 'edit/:id' => 'todos#edit', :as => :edit
  #put 'edit/:id/update' => 'todos#update'

  resources :todos, except: [:delete,:add]

  root 'todos#index' 

end
