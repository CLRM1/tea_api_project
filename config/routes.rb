Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      post '/subscriptions', to: 'subscription#create'
      get '/customers/:id/subscriptions', to: 'customer_subscriptions#show'
      put '/subscriptions', to: 'subscription#cancel'
    end 
  end
end
