Rails.application.routes.draw do
  devise_for :users, controllers: { 
    confirmations: 'users/confirmations', 
    omniauth_callbacks: 'users/omniauth_callbacks' }
  resources :users, only: [:index, :show, :destroy]

  root "static_pages#landing_page"
  # get 'static_pages/landing_page'
  # get 'static_pages/privacy_policy'
  get "privacy_policy", to: "static_pages#privacy_policy"
end
