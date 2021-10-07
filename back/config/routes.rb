Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :rooms,only: [:index,:show]
    end
  end

  # rails_admin設定
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
