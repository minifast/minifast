Minifast::Application.routes.draw do
  mount StyleGuide::Engine => "/style-guide"

  resources :home, only: [:index]
  root to: "home#index"
end
