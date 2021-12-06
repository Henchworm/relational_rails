Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"

  get '/parks', to: 'parks#index'
  get '/parks/new', to: 'parks#new'
  post '/parks', to: 'parks#create'
  get '/parks/:id', to: 'parks#show'
  get '/parks/:id/edit', to: 'parks#edit'
  patch '/parks/:id', to: 'parks#update'
  delete '/parks/:id', to: 'parks#destroy'
  get '/parks/:park_id/hikes', to: 'park_hikes#index'
  get '/parks/:park_id/hikes/new', to: 'park_hikes#new'
  post '/parks/:park_id/hikes', to: 'park_hikes#create'



  get '/hikes', to: 'hikes#index'
  get '/hikes/:id', to: 'hikes#show'
  get '/hikes/:id/edit', to: 'hikes#edit'
  patch '/hikes/:id', to: 'hikes#update'
  delete '/hikes/:id', to: 'hikes#destroy'

  get '/mtn_ranges', to: 'mtn_ranges#index'
  get '/mtn_ranges/new', to: 'mtn_ranges#new'
  post '/mtn_ranges', to: 'mtn_ranges#create'
  get '/mtn_ranges/:id', to: 'mtn_ranges#show'
  get '/mtn_ranges/:id/edit', to: 'mtn_ranges#edit'
  patch '/mtn_ranges/:id', to: 'mtn_ranges#update'
  get '/mtn_ranges/:mtn_range_id/mountains', to: 'mtn_range_mountains#index'
  get '/mtn_ranges/:mtn_range_id/mountains/new', to: 'mtn_range_mountains#new'
  post '/mtn_ranges/:mtn_range_id/mountains', to: 'mtn_range_mountains#create'
  delete '/mtn_ranges/:id', to: 'mtn_ranges#destroy'

  get '/mountains', to: 'mountains#index'
  get '/mountains/:id', to: 'mountains#show'
  get '/mountains/:id/edit', to: 'mountains#edit'
  patch '/mountains/:id', to: 'mountains#update'
  delete '/mountains/:id', to: 'mountains#destroy'

end
