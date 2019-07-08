Rails.application.routes.draw do
  get 'comments/index'
  get 'comments/new'
  get 'genres/show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

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

	#userのルーティング
	get 'users/:id/resign' => 'users#resign', as: 'resign'
	patch 'users/:id/resign_confirm' => 'users#resign_confirm', as: 'resign_confirm'

	#userに紐づくproductのルーティング
	resources :users, only:[:show, :edit, :update] do
		resources :products, only:[:index, :new, :create, :show, :edit, :update] do
			resources :comments, only: [:new, :index, :create, :edit, :update, :destroy]
		end
	end

	#fav/favoriteのルーティング
	get 'products/fav/:id' => 'favorites#fav', as: "fav_products"
	#about/productのルーティング
	get 'products/about' => 'products#about', as: 'products_about'

	#ジャンルのルーティング
	get 'genres/:id' => 'genres#show', as: 'genre'



end