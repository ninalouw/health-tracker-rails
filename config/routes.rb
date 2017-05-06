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
    resources :foods, only: [:index, :show, :create]
  end
end

end
