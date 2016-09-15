Rails.application.routes.draw do
  root :to => "application#index"
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}
  resources :users do
    resources :images, only: [:index]
  end
  resources :images, except: [:index] do
    resources :tags
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
