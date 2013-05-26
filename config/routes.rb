Minifast::Application.routes.draw do
  mount StyleGuide::Engine => "/style-guide" if defined?(StyleGuide::Engine)

  resources :home, only: [:index]
  root to: "home#index"
end
