Rails.application.routes.draw do

  if Rails.env.development?
    mount Goatmail::App, at: "/inbox"
  end

  root "static_pages#landing_page"

  devise_for :users, controllers: { 
    confirmations: 'users/confirmations', 
    #omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations' }

  resources :users, only: [:index, :show, :destroy, :edit, :update] do
    member do
      patch :ban
      patch :resend_confirmation_instructions
      patch :resend_invitation
    end
  end

  resources :courses do
    resources :lessons, except: [:index, :show], controller: "courses/lessons"
    member do
      patch :generate_lessons
    end
  end

  resources :services
  #resources :classrooms

  get "calendar", to: "static_pages#calendar"

end
