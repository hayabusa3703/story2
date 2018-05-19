Rails.application.routes.draw do
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

  post  'category/love'      =>  'storys#create'
  post  'category/marry'     =>  'storys#create'
  post  'category/study'     =>  'storys#create'
  post  'category/work'      =>  'storys#create'
  post  'category/newlife'   =>  'storys#create'
  post  'category/trip'      =>  'storys#create'
  post  'category/sick'      =>  'storys#create'
  post  'category/daily'     =>  'storys#create'

  get  'category/love/newest' => 'love#index'
    # loveカテゴリで新着順にする。love indexに記述？　newestに記述？
  get  'newest' => 'newest#index'
  get  'category/love' => 'love#index'
  get  'category/marry' => 'marry#index'
  get  'category/study' => 'study#index'
  get  'category/work' => 'work#index'
  get  'category/newlife' => 'newlife#index'
  get  'category/trip' => 'trip#index'
  get  'category/sick' => 'sick#index'
  get  'category/daily' => 'daily#index'









  get 'latest' => 'latest#index'
  get 'legend' => 'legend#index'
end
