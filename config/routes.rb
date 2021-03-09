Rails.application.routes.draw do
  resources :look_a_likes
  resources :events
  devise_for :users,  path: "", path_names: {sign_in: "login", sign_out: "logout", sign_up: "register"}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/", to: "pages#home", as: :root

  get "/profile", to: "users#user_profile", as: "user"

  get "/lookalikes", to: "look_a_likes#index"

  get "/user_events", to: "events#user_events", as: "user_events"
end
