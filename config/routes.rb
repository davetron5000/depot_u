Rails.application.routes.draw do
  get 'admin' => 'admin#index'
  controller :sessions do
    get  'login' => :new
    post 'login' => :create
    delete 'logout' => :destroy
  end

  resources :users
  resources :products do
    get :who_bought, on: :member
  end

  resources :support_requests, only: [ :index, :update ]

#START_HIGHLIGHT
  scope '(:locale)' do
#END_HIGHLIGHT
    resources :orders
    resources :line_items
    resources :carts
    root 'store#index', as: 'store_index', via: :all
#START_HIGHLIGHT
  end
#END_HIGHLIGHT
end
