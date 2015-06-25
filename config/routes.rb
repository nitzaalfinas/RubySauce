Rails.application.routes.draw do

  devise_for :users

	#---------------------------
	root  "landing#index"

  get 'search', to: 'search#index'
  
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
        
        get 'media_win', to: 'media#media_win_index'
        get 'media_win/the_page', to: 'media#media_win_the_page'
      end
    end
    
    resources :discuss do
      collection do
        post 'approve', to: 'discuss#approve'
        post 'disapprove', to: 'discuss#disapprove'
      end
    end
    
    resources :pages
    
    resources :themes do
      collection do
        post 'upload', to: 'themes#upload'
        post 'active/:id', to: 'themes#active'
        delete 'destroy/:id', to: 'themes#destroy'
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
    
    resources :akun do
      collection do
        get 'edit', to: 'akun#edit'
        post 'update', to: 'akun#update'
        patch 'update', to: 'akun#update'
      end
    end
    
  end
 
end
