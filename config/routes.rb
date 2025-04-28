Rails.application.routes.draw do
  # Routes pour la gestion de l'authentification
  devise_for :users
  root to: "pages#home"

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  # Routes de chat
  resources :chatrooms, only: [:index, :show] do
    resources :messages, only: [:create]
  end

  # Routes pour les réservations des utilisateurs
  resources :reservations, only: [:index, :edit, :update]

  # Routes pour les expériences et les avis
  resources :experiences, only: [:index, :show, :new, :create] do
    resources :reservations, only: [:index, :new, :create]
    resources :reviews, only: [:new, :create]
  end

  #
    # Ressources pour les réservations
    resources :reservations do
      member do
        post 'approve'
        post 'reject'
      end
    end






  # Routes pour approuver ou rejeter une réservation (dans Admin)
  # Déjà inclues dans le namespace admin/reservations
  # Pas besoin de routes supplémentaires pour approve/reject ici.
end
