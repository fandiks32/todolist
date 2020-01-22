Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'users/sessions' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :top
  post 'top/update_status', to: 'top#update_status'
  root to: "top#index"
end
