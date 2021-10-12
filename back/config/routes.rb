Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :rooms,only: [:index,:show] do
        member do
          get :comments
        end
      end
    end
  end

  # rails_admin設定
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  #action_cable設定
  mount ActionCable.server => '/cable'
end
