Rails.application.routes.draw do

  root to: 'public/homes#top'
  get "about" => "public/homes#about"
  get "admin" => "admin/homes#top"

  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    # get '/admins' => 'admins/homes#top'
    resources :products, only:[:index,:create,:show,:edit,:update,:new]
    resources :genres, only:[:index,:create,:edit,:update]
    resources :customers, only:[:index,:show,:edit,:update]
    resources :orders,only:[:index,:show,:update]
    resources :order_items, only:[:update]
  end

  scope module: :public do
    resources :products, only:[:index,:show] do
      get 'search' => "genres#search"
    end
    # idは必要ないためresoure
    get '/customers/my_page' => 'customers#show'
    get '/customers/information/edit' => 'customers#edit'
    patch '/customers/information' => 'customers#update'
    get '/customers/unsubscribe' => 'customers#unsubscribe'
    patch '/customers/delete_status' => 'customers#is_deleted'
    delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items, only:[:index,:update,:destroy,:create]
    get '/orders/thanks' => 'orders#thanks'
    get '/orders/new' => 'orders#new'
    post '/orders/confirm' => 'orders#confirm'
    resources :orders, only:[:index,:show,:create]
    resources :deliveries, only:[:index,:edit,:create,:update,:destroy]
  end

  # namespace :public do
  #   resources :products, only:[:index,:show] do
  #     get 'search' => "genres#search"
  #   end
  #   # idは必要ないためresoure
  #   get '/customers/my_page' => 'customers#show', module: 'public'
  #   get '/customers/infomation/edit' => 'customers#edit'
  #   get '/customers/infomation' => 'customers#update'
  #   get '/customers/unsubscribe' => 'customers#destroy'
  #   patch '/customers/delete_status' => 'customers#is_deleted'
  #   resources :cart_items, only:[:index,:update,:destroy,:create]
  #   delete '/cart_items/destroy_all' => 'cart_items#destroy_all'
  #   resources :orders, only:[:new,:index,:show,:create]
  #   get '/orders/new' => 'orders#new'
  #   post '/orders/confirm' => 'orders#confirm'
  #   get '/orders/thanks' => 'orders#thanks'
  #   resources :deliveries, only:[:index,:edit,:create,:update,:destroy]
  # end


end