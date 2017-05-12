Rails.application.routes.draw do
  get 'home/index'
  get 'journals/index'
  # get 'journals/show'
  post 'journals/create'

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  resources :zodiacs
end
