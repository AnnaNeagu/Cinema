Rails.application.routes.draw do
  get "welcome/index"
  root to: "welcome#index"
  resources :movies, only:[:index, :show, :new, :create]
end
