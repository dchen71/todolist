Rails.application.routes.draw do
  delete "delete" => "todos#delete", :as => :delete
  post "todos/add" => "todos#add", :via => :post 
  post 'todos/complete' => 'todos#complete', :via => :post 
  root 'todos#index' 
end
