Rails.application.routes.draw do
  resources :students do
    resources :addresses
  end
end
