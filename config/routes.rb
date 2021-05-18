Rails.application.routes.draw do
  resources :events
  resource :calendar, only: :show
end
