Rails.application.routes.draw do
  resources :students do
    resources :addresses
  end

  resources :courses, only: [:show]
end
