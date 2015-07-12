Rails.application.routes.draw do
  delete "delete" => "todos#delete", :as => :delete
  post 'complete' => 'todos#complete', :via => :post 

  resources :todos, except: [:delete,:add]

  root 'todos#index' 

end
