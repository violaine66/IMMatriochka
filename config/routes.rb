Rails.application.routes.draw do
  # Routes pour la gestion de l'authentification
  devise_for :users
  root to: "pages#home"

  # Routes de chat
  resources :chatrooms, only: [:index, :show] do
    resources :messages, only: [:create]
  end

  # Routes pour les réservations des utilisateurs
  resources :reservations, only: [:index]

  # Routes pour les expériences et les avis
  resources :experiences, only: [:index, :show, :new, :create] do
    resources :reservations, only: [:index, :new, :create]
    resources :reviews, only: [:new, :create]
  end

  # Routes Admin
  namespace :admin do
    # Cette route redirige vers l'action 'index' de 'admin/reservations'
    get 'dashboard', to: 'reservations#index', as: 'dashboard'

    # Ressources pour les réservations
    resources :reservations, only: [:index] do
      member do
        patch :approve
        patch :reject
      end
    end
  end


  # Routes pour approuver ou rejeter une réservation (dans Admin)
  # Déjà inclues dans le namespace admin/reservations
  # Pas besoin de routes supplémentaires pour approve/reject ici.
end
