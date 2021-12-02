Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "welcome#index"

  get '/parks', to: 'parks#index'
  get '/parks/:id', to: 'parks#show'

  get '/hikes', to: 'hikes#index'
  
  get '/mtn_ranges', to: 'mtn_ranges#index'
  get '/mtn_ranges/:id', to: 'mtn_ranges#show'
end
