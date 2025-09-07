Rails.application.routes.draw do
  devise_for :users
  root "events#index"

  resources :users, only: [:show]

  resources :events do
    # Attend an event
    post "attend", to: "event_attendances#create"
    # Remove attendance
    delete "attend", to: "event_attendances#destroy"
  end
end
