Rails.application.routes.draw do


  root                           'main#index'
  get 'help'                  => 'main#help'
  get 'signup'                => 'users#new'
  get 'login'                 => 'sessions#new'
  post 'login'                => 'sessions#create'
  delete 'logout'             => 'sessions#destroy'
  get 'competitions'          => 'competitions#index'
  get '/competitions/(:id)'   => 'competitions#select_photos'
  get '/info/(:id)'           => 'competitions#show_info'
  get '/results/(:id)'        => 'competitions#results'

  resources :users do
    member do
      #get :following, :followers #users/1/following users/1/followers
      get 'following'
      get 'followers'
    end
  end
  resources :albums #обеспечивает автоматический вызов всех методов REST
  resources :photos
  resources :values
  resources :relationships, only: [:create, :destroy]


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