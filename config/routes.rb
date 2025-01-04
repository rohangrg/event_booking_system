Rails.application.routes.draw do
  devise_for :users
  root "events#index"

  resources :tickets
  resources :events do
    collection do
      get :my
    end
  end
end
