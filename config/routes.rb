Rails.application.routes.draw do
  resources :websites
  root to: 'websites#index'


  match 'websites/:id/check_now' => 'websites#check_now', as: :check_now, via: :get


end
