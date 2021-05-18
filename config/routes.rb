Rails.application.routes.draw do
  root to: "events#index"

  resources :events
  resource :calendar, only: :show
end
