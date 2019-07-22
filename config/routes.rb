Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  	#Action Cableを利用する
  	mount ActionCable.server => '/cable'

	root 'products#index'

	devise_for :admins, controllers: {
	  sessions:      'admins/sessions',
	  passwords:     'admins/passwords',
	  registrations: 'admins/registrations'
	}
	devise_for :users, controllers: {
	  sessions:      'users/sessions',
	  passwords:     'users/passwords',
	  registrations: 'users/registrations'
	}

	#adminのルーティング
	namespace :admins do
		get 'admins/top' => 'homes#top', as: 'admins_top'
		resources :users, only:[:index, :show, :edit, :update, :destroy]
		resources :products, only:[:index, :show, :edit, :update, :destroy]
		resources :orders, only:[:index, :show, :destroy]
	end

	#userのルーティング
	#resign/userのルーティング
	get 'users/:id/resign' => 'users#resign', as: 'resign'
	patch 'users/:id/resign_confirm' => 'users#resign_confirm', as: 'resign_confirm'

	#userに紐づくproductのルーティング
	resources :users, only:[:show, :edit, :update] do
		resources :products, only:[:index, :new, :create, :show, :edit, :update] do
			resources :comments, only: [:new, :index, :create, :edit, :update, :destroy]
			resources :orders, only:[:new, :create]
			resources :messages, only:[:new, :show]
		end
		#userに紐づくbankのルーティング
		resources :banks, only:[:new, :create, :index, :edit, :update, :destroy]
	end
	#ルーム
	resources :rooms, only:[:create, :index, :show]
	#/index/order(特定の商品に紐付かない)のルーティング
	get 'orders/index' => 'orders#index', as: 'user_orders'

	#fav/favoriteのルーティング
	get 'products/fav/:id' => 'favorites#fav', as: "fav_products"
	#about/productのルーティング
	get 'products/about' => 'products#about', as: 'products_about'
	#seach_list/productのルーティング
	get 'search_list' => 'products#search_list', as: 'search'
	#confirm/orderのルーティング
	get 'orders/:id/confirm' => 'orders#confirm', as: 'order_confirm'
	#ジャンルのルーティング
	get 'genres/:id' => 'genres#show', as: 'genre'
	#jscrollの発火確認
	get 'products/test' => 'products#test'



end