Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  # Routes de chat
  resources :chatrooms, only: [:index, :show] do
    resources :messages, only: [:create]
  end



  resources :reservations, only: [:index]

  # Routes pour les expériences et les avis
  resources :experiences, only: [:index, :show, :new, :create] do
    resources :reservations, only: [:index, :new, :create]
    resources :reviews, only: [:new, :create]
  end
  resources :admin, only: [:approve, :reject]
  # Route pour le tableau de bord admin
  get 'admin/dashboard', to: 'admin#dashboard', as: 'admin_dashboard'
end
