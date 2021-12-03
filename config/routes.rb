Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"

  get '/parks', to: 'parks#index'
  get '/parks/:id', to: 'parks#show'

  get '/hikes', to: 'hikes#index'
  get '/hikes/:id', to: 'hikes#show'

  get '/mtn_ranges', to: 'mtn_ranges#index'
  get '/mtn_ranges/:id', to: 'mtn_ranges#show'

  get '/mountains', to: 'mountains#index'
  get '/mountains/:id', to: 'mountains#show'

  get '/parks/:park_id/hikes', to: 'park_hikes#index'
end
