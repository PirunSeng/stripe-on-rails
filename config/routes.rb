Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'plans#index'

  resources :plans, only: [:index] do
    resources :subscriptions
  end
end
