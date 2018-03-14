Rails.application.routes.draw do
  resources :users
  resource :session, only: [:new, :create, :destroy]
  resources :posts, only: [:new, :create, :destroy, :update, :edit, :show]
  resources :subs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
