Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#index'
  resources :storys do
    resources :likes, only: [:create, :destroy]
    resources :new, only: [:index, :new]
    member do
      delete :destroy
      patch :update
    end
  end

  resources :categorys , only: [:index, :show] do
    member do
      get :newest
    end
  end

  resources :storys, only: [:edit, :update, :new, :create]
  resources :latest, only: [:index]
  resources :legend, only: [:index]
end
