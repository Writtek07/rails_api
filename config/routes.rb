Rails.application.routes.draw do
  resources :moderators
  resources :authors
  resources :questions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
