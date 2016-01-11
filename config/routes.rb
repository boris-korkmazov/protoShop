Rails.application.routes.draw do
  root to: "main#index"

  resources :manufacturers, only:[:show] do
    resources :brand, only:[:show]
  end
end
