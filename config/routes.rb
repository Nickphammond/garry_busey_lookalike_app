Rails.application.routes.draw do
  resources :look_a_likes
  resources :events
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get "/", to: "pages#home", as: :root
end
