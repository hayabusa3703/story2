Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#index'
  resources :storys do
    resources :likes, only: [:create, :destroy]
    resources :new, only: [:index, :new]
  end

  resources :categorys , only: [:index, :show] do
    member do
      get :newest
    end
  end

  delete 'storys/:id' =>  'storys#destroy'
  patch  'storys/:id' => 'storys#update'
  get  'storys/:id/edit' => 'storys#edit'
  get 'latest' => 'latest#index'
  get 'legend' => 'legend#index'
end
