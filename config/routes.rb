Rails.application.routes.draw do
  get 'movies/index'
 get "welcome/index"
 root to: "welcome#index"
end
