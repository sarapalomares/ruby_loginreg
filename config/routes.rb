Rails.application.routes.draw do
  get '/' => "users#index"

  post '/create' => 'users#create'

  post '/login' => 'users#login'

  post '/info/:id' => 'users#info'

  get '/show' => 'users#show'

  post '/show' => 'users#show'

  post '/edit/:id' => 'users#edit'

  get '/edit/:id' => 'users#edit'

  post '/update' => 'users#update'

  post '/logout' =>  'users#logout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
