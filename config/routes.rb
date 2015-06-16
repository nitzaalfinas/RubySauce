Rails.application.routes.draw do

  devise_for :users

	#resources :articles

	#---------------------------
	root  "landing#index"

	get 'galleries', to: 'galleries#index'

	get ':permalink', to: 'article_single#index'

	get 'page/:permalink', to: 'page_single#index'

	get 'category/:permalink', to: 'percategory#index'	

	post 'discuss/send_insert', to: 'discuss#send_insert'


	#---------------------------

  namespace :adm do
    resources :dashboard
    resources :articles
    resources :categories
    
    resources :media, path: 'media' do
      collection do
        post 'upload'
        get 'edit'
        patch 'update/:id', to: 'media#update'
        delete 'destroy/:id', to: 'media#destroy'
      end
    end
    
    resources :discuss do
      collection do
        post 'approve', to: 'discuss#approve'
        post 'unapprove', to: 'discuss#unapprove'
      end
    end
    
    resources :pages
    
    resources :templates do
      collection do
        post 'upload', to: 'templates#upload'
        post 'active/:id', to: 'templates#active'
      end
    end
    
    resources :users
    
    resources :menus do
      collection do
        get 'edit', to: 'menus#edit'
        post 'update', to: 'menus#update'
        post 'update_draft', to: 'menus#update_draft'
        get 'draft_menu_element', to: 'menus#draft_menu_element'
        get 'current_menu_element', to: 'menus#current_menu_element'
        get 'save_menus', to: 'menus#save_menus'
        get 'form_manual', to: 'menus#form_manual'
        post 'form_manual_update', to: 'menus#form_manual_update'
      end
    end
    
    resources :settings do
      collection do
        patch 'update', to: 'settings#update'
      end
    end
    
    
  
  end

  get 'adm/media_win', to: 'adm_media_win#index'
  get 'adm/media_win/the_page', to: 'adm_media_win#the_page'

  
  get 'adm/akun/edit', to: 'adm_akun#edit'
  post 'adm/akun/update', to: 'adm_akun#update'
  patch 'adm/akun/update', to: 'adm_akun#update'

  
  
end
