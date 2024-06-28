Rails.application.routes.draw do
  resources :definitions
  root 'definitions#index'
end