Rails.application.routes.draw do
  root               'main#index'
  get 'help'      => 'main#help'
  get 'signup'    => 'users#new'
  get 'login'     => 'sessions#new'
  post 'login'    => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :users #обеспечивает автоматический вызов всех методов REST

  resources :comments
  resources :values
  resources :photos
  resources :albums
#
#  get 'work/choose_theme'
#  get 'work/display_theme'
#  get 'work/results_list'
  #resources :themes
  #resources :images


#  get 'main/help'
#  get 'main/about'
#  get 'main/contacts'

  #get 'work/index'
 # root to: 'work#index'  что это?
  #get '/work/(:id)' => 'work#choose_theme'

# For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end