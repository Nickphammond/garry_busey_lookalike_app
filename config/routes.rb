Rails.application.routes.draw do
  get 'static/lookalikes_show'
  resources :look_a_likes
  resources :suburbs
  resources :events
  resources :events_look_a_likes
  resources :users
  resources :look_a_likes do
    resources :suburbs
  end

  resources :look_a_likes do
    resources :events
  end

  devise_for :users,  path: "", path_names: {sign_in: "login", sign_out: "logout", sign_up: "register"}
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/", to: "pages#home", as: :root


  get "/profile", to: "users#user_profile", as: "user_profile"
  post "/profile/info", to: "users#update"
  patch "/profile/info", to: "users#update"
  put  "/profile/info", to: "users#update"
  get "/profile/info/edit", to: "users#edit_profile_info", as: "edit_profile_info"


  get "/profile/lookalike", to: "users#user_look_a_like", as: "user_look_a_like"
  get "/profie/loolalike/events", to: "users#user_look_a_like_events", as: "user_look_a_like_events"
  post "/profile/lookalike", to: "users#update"
  patch "/profile/lookalike", to: "users#update"
  put  "/profile/lookalike", to: "users#update"
  get "/profile/lookalike/edit", to: "users#look_a_like_form", as: "look_a_like_form"






  get "/lookalikes", to: "look_a_likes#index"

  get "/payments/success", to: "payments#success"

  get "/user_events", to: "events#user_events", as: "user_events"

  get "/submit_interest", to: "events#submit_interest", as: "submit_interest"

  get "/remove_suburb", to: "users#remove_suburb", as: "remove_suburb"

  get "/respond_interest", to: "events#respond_interest", as: "respond_interest"


  get "/suburbs/edit", to: "suburbs#edit", as: "edit_suburbs"

  get "/select_movie", to: "events#select_movie", as: "select_movie"

  get "/movies", to: "movies#index", as: "movies"

  get "/add_movie", to: "movies#add_movie", as: "add_movie"
end
