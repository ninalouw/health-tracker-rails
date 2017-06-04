Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'
  # Our foods routes
  resources :foods
  resources :users, only: [:create, :new, :update] do
    get :foods_list, on: :collection
  end
  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  namespace :api, defaults: {format: :json} do
  namespace :v1 do
    resources :foods, only: [:show, :create]
  end
end

get '/api/v1/foods/' => 'api/v1/foods#index'

# route to which our client-side application needs to POST the user's email
# and password, when the user fills out the log in form.
post '/login', to: "sessions#create"

end
