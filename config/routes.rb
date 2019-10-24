Rails.application.routes.draw do
  # get 'squads/index'
  #
  # get 'squads/show'
  resources :squads, only: %i[index show], defaults: { format: :json }
  resources :users, only: %i[index show], defaults: { format: :json }

  resources :feedbacks, onlye: %i[create show], defaults: { format: :json } do
    collection do
      get '/feedback_given/:user_id' => 'feedbacks#feedback_given'
      get '/feedback_received/:user_id' => 'feedbacks#feedback_received'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#hello'
end
