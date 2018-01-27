Rails.application.routes.draw do



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    root 'users#new'

    get '/home' => 'days#home'

    get '/days' => 'days#index'
    get '/days/today' => 'days#today'



    get '/days/:id/notes/new' => 'notes#day_note_new', as: 'day_note'
    post '/days/:id/notes' => 'notes#day_note_create'

    get '/login' => 'session#new'
    post '/login' => 'session#create'
    delete '/login' => 'session#destroy'

    get '/profile' => 'pages#profile'

    get '/admin'   => 'pages#admin_party'


    resources :days
    resources :tasks
    resources :notes
    resources :users

  end
