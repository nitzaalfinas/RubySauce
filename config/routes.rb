Rails.application.routes.draw do


	#PERBAIKI UNTUK MENCEGAH RECRUSIVE DOWNLOAD IMAGE
  
	devise_for :users

	resources :articles

	#---------------------------
	root  "landing#index"

	get 'galleries', to: 'galleries#index'

	get ':permalink', to: 'article_single#index'

	get 'page/:permalink', to: 'page_single#index'

	get 'category/:permalink', to: 'percategory#index'	

	post 'discuss/send_insert', to: 'discuss#send_insert'


	#---------------------------
	get 'adm/dashboard', to: 'adm_dashboard#index'

	get 'adm/articles', to: 'adm_articles#index'
	get 'adm/articles/new', to: 'adm_articles#new'
	post 'adm/articles/create', to: 'adm_articles#create'
	get 'adm/articles/edit', to: 'adm_articles#edit'
	patch 'adm/articles/update/:id', to: 'adm_articles#update'
  delete 'adm/articles/destroy/:id', to: 'adm_articles#destroy'

	get 'adm/categories', to: 'adm_categories#index'  
	get 'adm/categories/new', to: 'adm_categories#new'
	post 'adm/categories/create', to: 'adm_categories#create'
	get 'adm/categories/edit', to: 'adm_categories#edit'
	patch 'adm/categories/update/:id', to: 'adm_categories#update'
	delete 'adm/categories/destroy/:id', to: 'adm_categories#destroy'

	get 'adm/settings', to: 'adm_settings#index'
	patch 'adm/settings/update', to: 'adm_settings#update'

	get 'adm/media', to: 'adm_media#index'
	get 'adm/media/new', to: 'adm_media#new'
	post 'adm/media/upload', to: 'adm_media#upload'
	get 'adm/media/edit', to: 'adm_media#edit'
	patch 'adm/media/update/:id', to: 'adm_media#update'
	delete 'adm/media/destroy/:id', to: 'adm_media#destroy'

	get 'adm/pages', to: 'adm_pages#index'
	get 'adm/pages/new', to: 'adm_pages#new'
	post 'adm/pages/create', to: 'adm_pages#create'
	get 'adm/pages/edit', to: 'adm_pages#edit'
	patch 'adm/pages/update/:id', to: 'adm_pages#update'
  	delete 'adm/pages/destroy/:id', to: 'adm_pages#destroy'

  	get 'adm/media_win', to: 'adm_media_win#index'
  	get 'adm/media_win/the_page', to: 'adm_media_win#the_page'

  	get 'adm/discusses', to: 'adm_discuss#index'
  	post 'adm/discusses/approve', to: 'adm_discuss#approve'
  	post 'adm/discusses/unapprove', to: 'adm_discuss#unapprove'
  	
  	get 'adm/users', to: 'adm_users#index'
	get 'adm/users/new', to: 'adm_users#new'
	post 'adm/users/create', to: 'adm_users#create'
	get 'adm/users/edit', to: 'adm_users#edit'
	patch 'adm/users/update/:id', to: 'adm_users#update'
  	delete 'adm/users/destroy/:id', to: 'adm_users#destroy'

  	get 'adm/akun/edit', to: 'adm_akun#edit'
  	post 'adm/akun/update', to: 'adm_akun#update'
  	patch 'adm/akun/update', to: 'adm_akun#update'


  	get 'adm/menu', to: 'adm_menu#index'
  	get 'adm/menu/edit', to: 'adm_menu#edit'
  	post 'adm/menu/update', to: 'adm_menu#update'
  	post 'adm/menu/update_draft', to: 'adm_menu#update_draft'
  	get 'adm/menu/draft_menu_element', to: 'adm_menu#draft_menu_element'
  	get 'adm/menu/current_menu_element', to: 'adm_menu#current_menu_element'
  	get 'adm/menu/save_menus', to: 'adm_menu#save_menus'
  	get 'adm/menu/form_manual', to: 'adm_menu#form_manual'
  	post 'adm/menu/form_manual_update', to: 'adm_menu#form_manual_update'

end
