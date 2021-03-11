Rails.application.routes.draw do
  resources :look_a_likes
  resources :events
  resources :users
  devise_for :users,  path: "", path_names: {sign_in: "login", sign_out: "logout", sign_up: "register"}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/", to: "pages#home", as: :root

  get "/profile", to: "users#user_profile", as: "user_profile"

  post "/profile", to: "users#update"
  patch "/profile", to: "users#update"
  put  "/profile", to: "users#update"
  get "/profile/edit", to: "users#edit", as: "edit_profile"

  get "/lookalikes", to: "look_a_likes#index"

  get "/user_events", to: "events#user_events", as: "user_events"
end
