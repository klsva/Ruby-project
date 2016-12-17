Rails.application.routes.draw do
#
#  get 'work/choose_theme'
#  get 'work/display_theme'
#  get 'work/results_list'
  resources :themes
  resources :images
  resources :values
  resources :users
 root 'main#index'
  get 'main/index'
  get 'main/help'
  get 'main/about'
  get 'main/contacts'
  get 'work/index'
 # root to: 'work#index'  что это?
  get '/work/(:id)' => 'work#choose_theme'
  resources :themes
  resources :images

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end