Rails.application.routes.draw do
  get 'listings/index'

  get 'pages/index'

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "sessions", only: [:create]
  resources :tags, controller: "tags"
  resource :listingtags, only: [:create]
  resources :listings, controller: "listings"
  resources :reservations, controller: "reservations", only: [:create, :destroy, :index]
  resources :users
  resources :users, controller: "users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"
  get "/auth/:provider/callback" => "sessions#create_from_omniauth"
  root "users#show"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
