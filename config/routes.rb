Rails.application.routes.draw do
  # get 'squads/index'
  #
  # get 'squads/show'
  resources :squads, only: %i[index show]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#hello'
end