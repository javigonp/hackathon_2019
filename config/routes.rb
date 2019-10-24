Rails.application.routes.draw do
  # get 'squads/index'
  #
  # get 'squads/show'
  resources :squads, only: %i[index show], defaults: { format: :json }
  resources :users, only: %i[index show], defaults: { format: :json }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#hello'
end
