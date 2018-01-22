Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    root 'days#home'

    get '/days' => 'days#index'
    get '/days/today' => 'days#today'

    get '/notes/:id/new' => 'notes#day_note'

    resources :days
    resources :tasks
    resources :notes

end
