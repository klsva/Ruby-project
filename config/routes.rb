Rails.application.routes.draw do



  resources :comments
  resources :values
  resources :photos
  resources :albums
  resources :users
#
#  get 'work/choose_theme'
#  get 'work/display_theme'
#  get 'work/results_list'
  #resources :themes
  #resources :images

 root 'main#index'
  get 'main/help'
  get 'main/about'
  get 'main/contacts'

  #get 'work/index'
 # root to: 'work#index'  что это?
  #get '/work/(:id)' => 'work#choose_theme'

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end