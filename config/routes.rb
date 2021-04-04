Rails.application.routes.draw do
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'register' }

  root to: 'pages#home'
  
  get '/about-me', to: 'pages#about'
  get '/contact', to: 'pages#contact'
  
  resources :galleries, except: [:show]
  get 'gallery/:id', to: 'galleries#show', as: 'gallery_show'
  
  resources :blogs do
    member do
      patch :toggle_status
    end
  end
end
