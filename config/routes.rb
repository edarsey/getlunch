Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'sessions', registrations: 'registrations' }
  root to: "lunchtimes#index"

  resources :users do
    resources :lunchtimes, only: [:index, :create, :update, :destroy] do
      resource :invites, only: [] do
        collection do
          post 'accept'
          post 'decline'
        end
      end
    end
  end
end
