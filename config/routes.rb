Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#index'
    resources :storys do
      resources :likes, only: [:create, :destroy]
    end

    resources :storys do
      resources :comments, only: [:create]
    end
    resources :users, only: [:show]

  get   'storys'  =>  'storys#index'
  get   'storys/new'  =>  'storys#new'
  post  'storys'      =>  'storys#create'
  delete 'storys/:id' =>  'storys#destroy'
  patch  'storys/:id' => 'storys#update'
  get  'storys/:id/edit' => 'storys#edit'
  get  'newest' => 'newest#index'
  get 'latest' => 'latest#index'
  get 'legend' => 'legend#index'
end
