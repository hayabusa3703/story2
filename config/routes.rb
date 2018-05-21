Rails.application.routes.draw do
  # get 'categories/index'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#index'
    resources :storys do
      resources :likes, only: [:create, :destroy]
    end

  get   'storys'  =>  'storys#index'
  get   'storys/new'  =>  'storys#new'
  post  'storys'      =>  'storys#create'
  delete 'storys/:id' =>  'storys#destroy'
  patch  'storys/:id' => 'storys#update'
  get  'storys/:id/edit' => 'storys#edit'
  get  'newest' => 'newest#index'

  # post  'category/love'      =>  'storys#create'
  get  'category' => 'categorys#index'

  get 'latest' => 'latest#index'
  get 'legend' => 'legend#index'
end
