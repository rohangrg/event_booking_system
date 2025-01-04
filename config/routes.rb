Rails.application.routes.draw do
  devise_for :users
  root "events#index"

  resources :tickets do
    member do
      post :cancel
    end
  end
  resources :events do
    collection do
      get :my
    end
  end
end
